import re
from django.contrib.auth.models import User
from django.db.models.fields import NullBooleanField
from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from datetime import date, timedelta
from django.db import transaction
from django.core.exceptions import PermissionDenied

from .models import Puesto, Usuario, Ciudades, UsuarioVacuna, Vacuna, Tipo_de_Enfermedad

# Create your views here.

def login_user(request):
	if request.method == "POST":
		username = request.POST['username']
		password = request.POST['password']
		user = authenticate(request, username=username, password=password)
		if user is not None:
			login(request, user)
			return redirect('home')
		else:
			messages.success(request, ("Usuario o Contraseña invalido. Por favor, vuelva a intentarlo."))	
			return redirect('login')
	else:
		return render(request, 'registration/login.html', {})

def logout_user(request):
	logout(request)
	messages.success(request, ("Has finalizado sesión!"))
	return redirect('home')

@login_required(login_url='/accounts/login/') #debemos poner la url del login para que redirija a dicho lugar en caso de querer ingresar al home sin estar logueado
def principal(request):

	# NO TOCAR !!!!!
	# auxid_user = request.user.id # para obtener el id del user actualmente conectado
	# auxnro_usuario = Usuario.objects.get(user_id=auxid_user)
	# getDosis = UsuarioVacuna.objects.filter(usuario = auxnro_usuario)
	# print(getDosis.obtenerperiodo())

	staff = request.user.is_staff

	if (staff == False): # verificación para usuario normal

		id_user = request.user.id # para obtener el id del user actualmente conectado

		nro_usuario = Usuario.objects.get(user_id=id_user)
		print("Tu id es: " + str(id_user))
		#print(id_user)
		usuario_comun = nro_usuario.fecha_nac
		print("Tu cumpleaños es el: " + str(usuario_comun))
		#print(usuario_comun)

		# verificación dosis
		
		if (UsuarioVacuna.objects.filter(usuario=nro_usuario).exists()):
			dosis = UsuarioVacuna.objects.get(usuario=nro_usuario)
			# obtenemos el numero de dosis
			nro_dosis = dosis.cantidaddedosis
			print("Existe")
			
			# obtenemos el periodo entre cada aplicación de dosis
			
			# obtenemos la marca de la vacuna para mostrar en pantalla
			marca_vacuna = dosis.vacuna

			# obtenemos el id de la vacuna
			id_vacuna = dosis.vacuna_id
			
			# consultamos en la tabla Vacuna la existencia del id_vacuna obtenido anteriormente
			aux1 = Vacuna.objects.get(id=id_vacuna)
			id_tipoenfermedad = aux1.tipoenfermedad_id # aquí una vez comprobada en el paso anterior la existencia del id_vacuna, obtenemos "tipoenfermedad_id"

			# consultamos en la tabla Enfermedad "tipoenfermedad_id" obtenido anteriormente
			aux2 = Tipo_de_Enfermedad.objects.get(id=id_tipoenfermedad)
			enfermedad = aux2.nombre # aquí una vez comprobada en el paso anterior la existencia del id_tipoenfermedad, obtenemos el nombre de la enfermedad.
			

			periodo_dosis = dosis.periodoentredosisdias
			if (nro_dosis == 1): # para verficar que tiene puesta la primera dosis
				fecha_aplicacion = dosis.fecha_aplicacion
				print (fecha_aplicacion)
				clase = "bi bi-check-circle-fill"
				color = "orange"
				mensaje_textoPlano = "Usted posee la primera dosis."
				#fecha_actual = date.today()
				sigte_dosis = fecha_aplicacion + timedelta(days=periodo_dosis)
				messages.add_message(request, messages.INFO, "Su siguiente dosis a aplicar está estimada para el: ")
				print("Usted posee la primera dosis") # mensaje para probar nada mas en consola

				diccionario = {
					'fecha' : usuario_comun,
					'clase' : clase,
					'color' : color,
					'texto' : mensaje_textoPlano,
					'sigtedosis' : sigte_dosis,
					'enfermedad' : enfermedad,
					'nro_dosis' : nro_dosis,
					'marca' : marca_vacuna,
					'titulo_pagina' : "Inicio",
					}
				
				return render(request, 'vacunateuc/home.html', diccionario)
			
				#mensajeSigteDosis = "Su siguiente dosis a aplicar será el: " + str(sigte_dosis)

			elif (nro_dosis >= 2): # para verficar que tiene puesta la dosis completa
				clase = "bi bi-check-circle-fill"
				color = "green"
				mensaje_textoPlano = "Usted posee la dosis completa."
				print("Usted posee la dosis completa") # mensaje para probar nada mas en consola
				diccionario = {
					'fecha' : usuario_comun,
					'clase' : clase,
					'color' : color,
					'texto' : mensaje_textoPlano,
					'enfermedad' : enfermedad,
					'nro_dosis' : nro_dosis,
					'marca' : marca_vacuna,
					'titulo_pagina' : "Inicio",
					}

				return render(request, 'vacunateuc/home.html', diccionario )

			elif (nro_dosis == 0): # para verficar que no tiene ninguna dosis puesta
				usuarioactual = request.user
				username1 = User.objects.get(username = usuarioactual)
				id_username1 = username1.id
				username2 = Usuario.objects.get(user_id = id_username1)
				id_username2 = username2.id
				if (UsuarioVacuna.objects.filter(usuario_id = id_username2).exists()):
					username3 = UsuarioVacuna.objects.get(usuario_id = id_username2)
					obtiene_estado = username3.estado
					print(obtiene_estado)
				else:
					obtiene_estado = False
				clase = "bi bi-x-circle-fill"
				color = "red"
				mensaje_textoPlano = "Usted aún no posee ninguna dosis."
				message = "¡ATENCIÓN! Usted ya ha solicitado un agendamiento para la vacunación."
				print("Usted aún no posee ninguna dosis") # mensaje para probar nada mas en consola

				diccionario = {
					'fecha' : usuario_comun,
					'clase' : clase,
					'color' : color,
					'texto' : mensaje_textoPlano,
					'titulo_pagina' : "Inicio",
					'estado' : obtiene_estado,
					'nro_dosis' : nro_dosis,
					'message' : message,
					}

				return render(request, 'vacunateuc/home.html', diccionario )
				
		else: # para verficar que no tiene ninguna dosis puesta
			usuarioactual = request.user
			username1 = User.objects.get(username = usuarioactual)
			id_username1 = username1.id
			username2 = Usuario.objects.get(user_id = id_username1)
			id_username2 = username2.id
			if (UsuarioVacuna.objects.filter(usuario_id = id_username2).exists()):
				username3 = UsuarioVacuna.objects.get(usuario_id = id_username2)
				obtiene_estado = username3.estado
				print(obtiene_estado)
			else:
				obtiene_estado = False
			clase = "bi bi-x-circle-fill"
			color = "red"
			mensaje_textoPlano = "Usted aún no posee ninguna dosis."
			print("Usted aún no posee ninguna dosis") # mensaje para probar nada mas en consola

			diccionario = {
				'fecha' : usuario_comun,
				'clase' : clase,
				'color' : color,
				'texto' : mensaje_textoPlano,
				'titulo_pagina' : "Inicio",
				'estado' : obtiene_estado
				}

			return render(request, 'vacunateuc/home.html', diccionario )

	else: # verificación para usuario admin
		id_user = request.user.id # para obtener el id del user actualmente conectado
		nro_usuario = Usuario.objects.get(user_id=id_user)
		usuario_admin = nro_usuario.fecha_nac

		# verificación dosis
		
		if (UsuarioVacuna.objects.filter(usuario=nro_usuario).exists()):
			dosis = UsuarioVacuna.objects.get(usuario=nro_usuario)
			# obtenemos el numero de dosis
			nro_dosis = dosis.cantidaddedosis
			print("Existe")
			
			# obtenemos el periodo entre cada aplicación de dosis
			
			# obtenemos la marca de la vacuna para mostrar en pantalla
			marca_vacuna = dosis.vacuna

			# obtenemos el id de la vacuna
			id_vacuna = dosis.vacuna_id
			
			# consultamos en la tabla Vacuna la existencia del id_vacuna obtenido anteriormente
			aux1 = Vacuna.objects.get(id=id_vacuna)
			id_tipoenfermedad = aux1.tipoenfermedad_id # aquí una vez comprobada en el paso anterior la existencia del id_vacuna, obtenemos "tipoenfermedad_id"

			# consultamos en la tabla Enfermedad "tipoenfermedad_id" obtenido anteriormente
			aux2 = Tipo_de_Enfermedad.objects.get(id=id_tipoenfermedad)
			enfermedad = aux2.nombre # aquí una vez comprobada en el paso anterior la existencia del id_tipoenfermedad, obtenemos el nombre de la enfermedad.
			

			periodo_dosis = dosis.periodoentredosisdias
			if (nro_dosis == 1): # para verficar que tiene puesta la primera dosis
				fecha_aplicacion = dosis.fecha_aplicacion
				print (fecha_aplicacion)
				clase = "bi bi-check-circle-fill"
				color = "orange"
				mensaje_textoPlano = "Usted posee la primera dosis."
				#fecha_actual = date.today()
				sigte_dosis = fecha_aplicacion + timedelta(days=periodo_dosis)
				messages.add_message(request, messages.INFO, "Su siguiente dosis a aplicar está estimada para el: ")
				print("Usted posee la primera dosis") # mensaje para probar nada mas en consola

				diccionario = {
					'fecha' : usuario_admin,
					'clase' : clase,
					'color' : color,
					'texto' : mensaje_textoPlano,
					'sigtedosis' : sigte_dosis,
					'enfermedad' : enfermedad,
					'nro_dosis' : nro_dosis,
					'marca' : marca_vacuna,
					'titulo_pagina' : "Inicio",
					}
				
				return render(request, 'vacunateuc/home.html', diccionario)
			
				#mensajeSigteDosis = "Su siguiente dosis a aplicar será el: " + str(sigte_dosis)

			elif (nro_dosis >= 2): # para verficar que tiene puesta la dosis completa
				clase = "bi bi-check-circle-fill"
				color = "green"
				mensaje_textoPlano = "Usted posee la dosis completa."
				print("Usted posee la dosis completa") # mensaje para probar nada mas en consola
				diccionario = {
					'fecha' : usuario_admin,
					'clase' : clase,
					'color' : color,
					'texto' : mensaje_textoPlano,
					'enfermedad' : enfermedad,
					'nro_dosis' : nro_dosis,
					'marca' : marca_vacuna,
					'titulo_pagina' : "Inicio",
					}

				return render(request, 'vacunateuc/home.html', diccionario )

			elif (nro_dosis == 0): # para verficar que no tiene ninguna dosis puesta
				usuarioactual = request.user
				username1 = User.objects.get(username = usuarioactual)
				id_username1 = username1.id
				username2 = Usuario.objects.get(user_id = id_username1)
				id_username2 = username2.id
				if (UsuarioVacuna.objects.filter(usuario_id = id_username2).exists()):
					username3 = UsuarioVacuna.objects.get(usuario_id = id_username2)
					obtiene_estado = username3.estado
					print(obtiene_estado)
				else:
					obtiene_estado = False
				clase = "bi bi-x-circle-fill"
				color = "red"
				mensaje_textoPlano = "Usted aún no posee ninguna dosis."
				message = "¡ATENCIÓN! Usted ya ha solicitado un agendamiento para la vacunación."
				print("Usted aún no posee ninguna dosis") # mensaje para probar nada mas en consola

				diccionario = {
					'fecha' : usuario_admin,
					'clase' : clase,
					'color' : color,
					'texto' : mensaje_textoPlano,
					'titulo_pagina' : "Inicio",
					'estado' : obtiene_estado,
					'nro_dosis' : nro_dosis,
					'message' : message,
					}

				return render(request, 'vacunateuc/home.html', diccionario )
				
		else: # para verficar que no tiene ninguna dosis puesta
			usuarioactual = request.user
			username1 = User.objects.get(username = usuarioactual)
			id_username1 = username1.id
			username2 = Usuario.objects.get(user_id = id_username1)
			id_username2 = username2.id
			if (UsuarioVacuna.objects.filter(usuario_id = id_username2).exists()):
				username3 = UsuarioVacuna.objects.get(usuario_id = id_username2)
				obtiene_estado = username3.estado
				print(obtiene_estado)
			else:
				obtiene_estado = False
			clase = "bi bi-x-circle-fill"
			color = "red"
			mensaje_textoPlano = "Usted aún no posee ninguna dosis."
			print("Usted aún no posee ninguna dosis") # mensaje para probar nada mas en consola

			diccionario = {
				'fecha' : usuario_admin,
				'clase' : clase,
				'color' : color,
				'texto' : mensaje_textoPlano,
				'titulo_pagina' : "Inicio",
				'estado' : obtiene_estado
				}

			return render(request, 'vacunateuc/home.html', diccionario )

		print("Usuario admin")

def prueba(request):
	return render(request, 'vacunateuc/prueba.html')

# def personalBlanco(request):
# 	#personalblanco= PersonalBlanco.objects.all()
# 	context = {'personal': PersonalBlanco.objects.all(), 'title': 'personal'}	
# 	return render(request, 'vacunateuc/personalblanco.html', context)

def registroUsuarioComun(request):
	
	if request.method == 'POST':
		with transaction.atomic():
			first_name = request.POST.get("first_name")
			last_name = request.POST.get("last_name")
			username = request.POST.get("username") # esto es el nro de C.I.
			password1 = request.POST.get("password1")
			password2 = request.POST.get("password2")
			fecha_nac = request.POST.get("fecha_nac")
			#fecha_nac = datetime.now()
			departamento = request.POST.get("departamento")
			departamento = "Guaira"
			ciudad = request.POST.get("ciudad")
			#print(ciudad)

			if password1 == password2:
				# Tabla User Django
				user = User(
					username = username,
					first_name = first_name,
					last_name = last_name,			
				)
				user.set_password(password1)
				user.save()

				# Perfil (Tabla Usuario)
				perfil = Usuario(
					user = user,
					fecha_nac = fecha_nac,
					departamento = departamento,
					ciudad = ciudad,
				)
				perfil.save()

				# logueo directo si hubo un registro correcto
				user = authenticate(request, username=username, password=password1)
				login(request, user)
				return redirect('home')
			else:
				messages.success(request, ("Error. Las contraseñas no coinciden"))

	else:
		messages.success(request, (""))

	context = {'ciudad': Ciudades.objects.all(), 'titulo_pagina' : "Registro de usuario"}
	
	return render(request, 'registration/registrousuario.html', context)

@login_required(login_url='/accounts/login/') #debemos poner la url del login para que redirija a dicho lugar en caso de querer ingresar al home sin estar logueado
def solicitud_vacuna(request):
	
	id_user = request.user.id # para obtener el id del user actualmente conectado
	nro_usuario = Usuario.objects.get(user_id=id_user) # nro de usuario
	
	if (UsuarioVacuna.objects.filter(usuario=nro_usuario).exists()):

		#raise PermissionDenied
		return redirect('home')

	else:
		context = {
			'titulo_pagina' : "Solicitud de agendamiento", 
			'tipo_enfermedad' : Tipo_de_Enfermedad.objects.all(),
			'marca_vacuna' : Vacuna.objects.all(),
			'puesto_vacunatorio' : Puesto.objects.all(),
			'title' : 'puesto_vacunatorio',
			}
		if request.method == 'POST':
			with transaction.atomic(): # esto usamos para evitar que se guarde un registro en caso de que algún campo genere problemas
				#tipodeenfermedad=request.POST.get("tipo_de_enfermedad")
				marcadevacuna = request.POST.get("marca_de_vacuna")
				puestovacunatorio = request.POST.get("puesto_vacuna")
				usuarioactual = request.user
				print("#########################")
				print(marcadevacuna)
				print(puestovacunatorio)
				print(usuarioactual)
				print("#########################")
				marca = Vacuna.objects.get(nombre=marcadevacuna)
				periododosis = marca.periodoentredosis
				#print(periododosis)
				instancia = Usuario.objects.get(user = usuarioactual)

				usuario_vacuna = UsuarioVacuna(
					puesto = Puesto.objects.get(nombre = puestovacunatorio),
					vacuna = Vacuna.objects.get(nombre = marcadevacuna),
					usuario = instancia,
					cantidaddedosis = 0,
					periodoentredosisdias = periododosis
				)
				usuario_vacuna.save()
				return redirect('home')			
		return render(request, 'vacunateuc/solicitudvacuna.html', context)
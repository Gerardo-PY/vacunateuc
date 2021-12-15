from django.contrib.auth.models import User
from django.db.models.fields import NullBooleanField
from django.http.response import HttpResponse
from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from datetime import datetime
from django.db import transaction

from .models import Usuario

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
    return render(request, 'vacunateuc/home.html')

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

			if password1 == password2:
				# User
				user = User(
					username = username,
					first_name = first_name,
					last_name = last_name,
					#password = password1,
				)
				user.set_password(password1)
				user.save()

				# Perfil (Usuario)
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
	return render(request, 'registration/registrousuario.html', {}) 

	
	# if request.method == 'POST':
	# 	first_name = request.POST['first_name']
	# 	last_name = request.POST['last_name']
	# 	username = request.POST['username'] # este campo representa la C.I. dela persona, a modo de utiizar como un nombre de usuario único
	# 	password1 = request.POST['password1']
	# 	password2 = request.POST['password2']
	# 	fechanac = request.POST['fechanac']
	# 	departamento = request.POST['depto']
	# 	#depto = request.POST['depto']
	# 	city = request.POST['city']

	# 	if password1 == password2:
	# 		if Usuario.objects.filter(cedula=username).exists():
	# 			print('Username taken')
	# 		else:
	# 			user = Usuario.objects.create(nombre=first_name, apellido=last_name, fecha_nac=fechanac, cedula=username, ciudad=city, password=password1, departamento = departamento, )
	# 			user.save()
	# 			print('Usuario creado')
	# 	else:
	# 		print("Las contraseñas no coinciden")
	# 	return redirect('/accounts/login/')
	# if request.method == 'POST':
	# 	user_form=UserForm(data=request.POST)
		
	# 	if user_form.is_valid():
	# 		user_form.save()
	# 		messages.success(request, ("Usuario registrado con éxito."))
	# 	else:
	# 		messages.success(request, ("Hubo un error inesperado. Vuelva a intentarlo."))
	# else:
	# 	user_form = UserForm(data=request.POST)
	# 	#info_form = InfoProfileForm(data=request.POST)
		
	
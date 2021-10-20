from django.shortcuts import redirect, render
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from datetime import datetime
from django.contrib.auth.decorators import login_required

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
def principal(request, year=datetime.now()):

    # Get current year
    now = datetime.now()
    current_year = now.year

    return render(request, 'vacunateuc/home.html', {"current_year": current_year,})

def prueba(request):
	return render(request, 'vacunateuc/prueba.html')
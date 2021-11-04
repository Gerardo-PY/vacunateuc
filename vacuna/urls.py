# from django.urls import path
# from .views import login, home

# urlpatterns = [
#     path('', login, name="login"),
#     path('home/', home, name="home"),
# ]

# from django.conf.urls import url
# from . import views
# from django.contrib.auth.views import LoginView, logout_then_login

# app_name='accounts'

# urlpatterns = [
#     url(r'^home/$', views.home , name='home'),
#     url(r'^$' , LoginView.as_view(template_name='vacunateuc/login.html'))

# ]

from os import name
from django.conf.urls import include
from django.urls import path
from django.urls.resolvers import URLPattern
from . import views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LoginView, LogoutView

urlpatterns = [
    path('', views.principal, name='home'),
    path('accounts/login/', views.login_user, name="login"),
    #path('accounts/', include('django.contrib.auth.urls')),
    path('logout/', views.logout_user, name="logout"),
    path('prueba', views.prueba, name="prueba"),
<<<<<<< HEAD
=======
    path('personalblanco', views.personal, name="personalblanco"),

>>>>>>> 8080a66 (2Parcial)
]
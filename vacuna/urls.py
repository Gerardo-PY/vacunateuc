from os import name
from django.conf.urls import include
from django.urls import path
from django.urls.resolvers import URLPattern
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.principal, name='home'),
    path('accounts/login/', views.login_user, name="login"),
    #path('accounts/', include('django.contrib.auth.urls')),
    path('logout/', views.logout_user, name="logout"),
    path('prueba', views.prueba, name="prueba"),
    #path('personalblanco', views.personalBlanco, name="personalblanco"),
    path('registro-usuario/', views.registroUsuarioComun, name="registrousuario"),
    path('solicitud-vacuna/', views.solicitud_vacuna, name='solicitudvacuna'),
    path('informaciones/', views.informaciones_varias, name='informaciones')
]


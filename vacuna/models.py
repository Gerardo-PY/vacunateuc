from django.db import models
from django.db.models.deletion import CASCADE
from django.db.models.expressions import Case
from django.contrib.auth.models import User

# Create your models here.


class Sede(models.Model):
    nombre = models.CharField(max_length=200)
    habilitado = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre


class Puesto(models.Model):
    nombre = models.CharField(max_length=200)
    habilitado = models.BooleanField(default=False)
    sede = models.ForeignKey(Sede, on_delete=CASCADE)

    def __str__(self):
        return self.nombre


class Modalidad_Vacunatorio(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.CharField(max_length=200)

    def __str__(self):
        return self.nombre



class Puesto_Tipo_Vacunatorio(models.Model):
   puesto = models.ForeignKey(Puesto, on_delete=CASCADE)
   habilitado = models.BooleanField(default=False)
   modalidadvacunatorio = models.ForeignKey(Modalidad_Vacunatorio, on_delete=CASCADE)


#ver que columnas mas se le puede agregar a esta table de Vacuna_Puesto
class Vacuna_Puesto(models.Model):
    puesto = models.ForeignKey(Puesto, on_delete=CASCADE)

    def __srt__(self):
        return str(self.puesto.nombre)


class Tipo_de_Enfermedad(models.Model):
    nombre = models.CharField(max_length=150)

    def __str__(self):
        return self.nombre


class Vacuna(models.Model):
    nombre = models.CharField(max_length=100, verbose_name="Plataforma - Marca")
    tipoenfermedad = models.ForeignKey(Tipo_de_Enfermedad, on_delete=CASCADE, verbose_name="Tipo de enfermedad")
    cantidaddosis = models.IntegerField(verbose_name="Cantidad de dosis")
    rangoetarioinicio = models.IntegerField(verbose_name="Inicio de rango etario")
    rangoetariofin = models.IntegerField(verbose_name="Fin de rango etario")
    periodoentredosis =  models.IntegerField(verbose_name="Periodo entre dosis")

    def __str__(self):
        return self.nombre


class Usuario(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True) # username, password, etc. (usaremos el nro de ci como user)
    #nombre = models.CharField(max_length=150, verbose_name="Nombre (s)")
    #apellido = models.CharField(max_length=150, verbose_name="Apellido (s)")
    fecha_nac = models.DateField(verbose_name="Fecha de nacimiento")
    departamento = models.CharField(max_length=150, verbose_name="Departamento")
    ciudad = models.CharField(max_length=150, verbose_name="Ciudad")
    #if_staff = models.BooleanField(default=False)
    #password = models.CharField(max_length=150, verbose_name="Contraseña")

    def __str__(self):
        #return f"{self.user.username}"
        return str(self.user.username)
        #return str(self.fecha_nac)


class UsuarioVacuna(models.Model):
    puesto = models.ForeignKey(Puesto, on_delete=CASCADE, verbose_name="Puesto de vacunación")
    vacuna = models.ForeignKey(Vacuna, on_delete=CASCADE, verbose_name="Marca de Vacuna")
    usuario = models.ForeignKey(Usuario, on_delete=CASCADE)
    cantidaddedosis = models.IntegerField(verbose_name="Cantidad de dosis aplicada")
    periodoentredosisdias = models.IntegerField(verbose_name="Periodo entre dosis", editable=False)
    fecha_aplicacion = models.DateField(verbose_name="Fecha de aplicación de dosis", null=True)
    estado = models.BooleanField(default=False, verbose_name="Estado")
    
    def __str__(self):
        return str(self.usuario.user)

class Ciudades(models.Model):
    nombre_ciudad = models.CharField(max_length=150, verbose_name= "Ciudad")

    def __str__(self):
        return self.nombre_ciudad
    












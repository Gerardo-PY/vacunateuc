from django.db import models
from django.db.models.base import Model
from django.db.models.deletion import CASCADE
from django.db.models.expressions import Case

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


class Tipo_de_Enfermedad(models.Model):
    nombre = models.CharField(max_length=150)


class Vacuna(models.Model):
    nombre = models.CharField(max_length=100)
    tipoenfermedad = models.ForeignKey(Tipo_de_Enfermedad, on_delete=CASCADE)
    cantidaddosis = models.IntegerField(int)
    rangoetarioinicio = models.IntegerField(int)
    rangoetariofin = models.IntegerField(int)
    periodoentredosis =  models.IntegerField(int)


class Usuario(models.Model):
    nombre = models.CharField(max_length=150)
    apellido = models.CharField(max_length=150)
    edad = models.IntegerField(int)
    cedula = models.CharField(max_length=100)
    ciudad = models.CharField(max_length=150)
    password = models.CharField(max_length=150)


class UsuarioVacuna(models.Model):
    puesto = models.ForeignKey(Puesto, on_delete=CASCADE)
    vacuna = models.ForeignKey(Vacuna, on_delete=CASCADE)
    usuario = models.ForeignKey(Usuario, on_delete=CASCADE)
    cantidaddedosis = models.IntegerField(int)
    periodoentredosisdias = models.IntegerField(int)

class Profesiones(models.Model):
    nombre = models.CharField(max_length=150)

    def __str__(self):
        return self.nombre

class PersonalBlanco(models.Model):
    nombre = models.CharField(max_length=150)
    apellido = models.CharField(max_length=150)
    cedula = models.CharField(max_length=100)
    registro = models.IntegerField()
    direccion = models.CharField(max_length=150)
    telefono = models.CharField(max_length=150)
    profesion = models.ForeignKey(Profesiones, on_delete=CASCADE)
    sede = models.ForeignKey(Sede, on_delete=CASCADE)

    def __str__(self):
        return self.nombre


    












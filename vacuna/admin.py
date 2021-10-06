from django.contrib import admin

from vacuna.models import Modalidad_Vacunatorio, Puesto, Puesto_Tipo_Vacunatorio, Sede, Tipo_de_Enfermedad, Usuario, UsuarioVacuna, Vacuna, Vacuna_Puesto

# Register your models here.

admin.site.register(Sede)
admin.site.register(Puesto)
admin.site.register(Modalidad_Vacunatorio)
admin.site.register(Puesto_Tipo_Vacunatorio)
admin.site.register(Vacuna_Puesto)
admin.site.register(Tipo_de_Enfermedad)
admin.site.register(Vacuna)
admin.site.register(Usuario)
admin.site.register(UsuarioVacuna)

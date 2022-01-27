from django.contrib import admin

from vacuna.models import Ciudades, Modalidad_Vacunatorio, Puesto, Puesto_Tipo_Vacunatorio, Sede, Tipo_de_Enfermedad, Usuario, UsuarioVacuna, Vacuna, Vacuna_Puesto

# Register your models here.

admin.site.register(Sede)
admin.site.register(Puesto)
admin.site.register(Modalidad_Vacunatorio)
admin.site.register(Puesto_Tipo_Vacunatorio)
admin.site.register(Vacuna_Puesto)
admin.site.register(Tipo_de_Enfermedad)
admin.site.register(Vacuna)

class UsuarioAdmin(admin.ModelAdmin):
    list_display = ('user', 'fecha_nac', 'departamento', 'ciudad',)
admin.site.register(Usuario, UsuarioAdmin)

class UsuarioVacunaAdmin(admin.ModelAdmin):
    readonly_fields = ('obtenerperiodo',)
    list_display = ('usuario','vacuna', 'puesto', 'cantidaddedosis', 'fecha_aplicacion', 'estado',)
    class Media:
        js = (
            '//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js', # jquery
            'vacunateuc/admin.js',   # inside app static folder
        )
admin.site.register(UsuarioVacuna, UsuarioVacunaAdmin)

admin.site.register(Ciudades)

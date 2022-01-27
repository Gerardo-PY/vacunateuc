from django.contrib import admin

from vacuna.models import Ciudades, Modalidad_Vacunatorio, Puesto, Puesto_Tipo_Vacunatorio, Sede, Tipo_de_Enfermedad, Usuario, UsuarioVacuna, Vacuna, Vacuna_Puesto

# Register your models here.
class SedeAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'habilitado')
admin.site.register(Sede, SedeAdmin)

class PuestoAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'habilitado', 'sede', 'horario_inicio', 'horario_fin')
admin.site.register(Puesto, PuestoAdmin)

class ModalidadAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'descripcion')
admin.site.register(Modalidad_Vacunatorio, ModalidadAdmin)

admin.site.register(Puesto_Tipo_Vacunatorio)
admin.site.register(Vacuna_Puesto)

class TipoEnfermedadAdmin(admin.ModelAdmin):
    list_display = ('nombre',)
admin.site.register(Tipo_de_Enfermedad, TipoEnfermedadAdmin)

class VacunaAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'tipoenfermedad', 'cantidaddosis', 'periodoentredosis')
admin.site.register(Vacuna, VacunaAdmin)

class UsuarioAdmin(admin.ModelAdmin):
    list_display = ('user', 'fecha_nac', 'departamento', 'ciudad',)
admin.site.register(Usuario, UsuarioAdmin)

class UsuarioVacunaAdmin(admin.ModelAdmin):
    list_display = ('usuario','vacuna', 'puesto', 'cantidaddedosis', 'fecha_aplicacion', 'estado',)
    class Media:
        js = (
            '//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js', # jquery
            'vacunateuc/admin.js',   # inside app static folder
        )
admin.site.register(UsuarioVacuna, UsuarioVacunaAdmin)

admin.site.register(Ciudades)

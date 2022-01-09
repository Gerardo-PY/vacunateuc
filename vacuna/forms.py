from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from django.forms import fields, widgets

class SignUpForm(UserCreationForm):
    #usuario
    #nombre
    #apellido
    #fecha_nac
    #cedula
    #departamento
    #ciudad
    #password
    
    fecha_nac = forms.DateField(label = 'Fecha de nacimiento', widget = forms.DateInput(
        attrs = {
            'class': 'form-control',
            'placeholder': 'Ingrese su fecha de nacimiento',
            'id': 'fecha_nac',
            'required': 'required',
        }
    ))
    departamento = forms.CharField(label= 'Departamento', widget = forms.TextInput(
        attrs = {
            'class': 'form-control',
            'placeholder': 'Ingrese su departamento',
            'id': 'departamento',
            'required': 'required',
        }
    ))
    ciudad = forms.CharField(label= 'Ciudad', widget = forms.TextInput(
        attrs = {
            'class': 'form-control',
            'placeholder': 'Ingrese su ciudad',
            'id': 'ciudad',
            'required': 'required',
        }
    ))
    class Meta:
         model = User
         # username seria C.I. para nosotros
         fields = ('first_name', 'last_name', 'username', 'password1', 'password2', 'fecha_nac', 'departamento', 'ciudad')
         widgets = {
             'first_name' : forms.TextInput(
                attrs= {
                    'class': 'form-control',
                    'placeholder': 'Ingrese su nombre (s)',
                    'required': 'required',
                 }
             ),
             'last_name' : forms.TextInput(
                attrs= {
                    'class': 'form-control',
                    'placeholder': 'Ingrese su apellido (s)',
                    'required': 'required',
                 }
             ),
             'username' : forms.NumberInput(
                attrs= {
                    'class': 'form-control',
                    'placeholder': 'Ingrese su nro. de documento',
                    'required': 'required',
                 }
             ),
             'password1' : forms.PasswordInput(
                attrs= {
                    'class': 'form-control',
                    'placeholder': 'Ingrese su contraseña',
                    'required': 'required',
                 }
             ),
             'password2' : forms.PasswordInput(
                attrs= {
                    'class': 'form-control',
                    'placeholder': 'Repita su contraseña',
                    'required': 'required',
                 }
             ),
         }

    

    


class UserForm(forms.ModelForm):
    pass
    
    # original registro
    # password1 = forms.CharField(label = 'Confirmación de Contraseña', widget = forms.PasswordInput(
    #     attrs = {
    #         'class': 'form-control',
    #         'placeholder': 'Ingrese nuevamente su contraseña',
    #         'id': 'password1',
    #         'required': 'required',
    #     }
    # ))
    
    
    # original registro
    # class Meta():
    #     model=Usuario 
    #     fields = ('nombre', 'apellido', 'cedula', 'password', 'fecha_nac', 'ciudad')
    #     widgets = {
    #         'nombre': forms.TextInput(
    #             attrs = {
    #                 'class': 'form-control',
    #                 'placeholder': 'Ingrese su nombre',
    #             }
    #         ),
    #         'apellido': forms.TextInput(
    #             attrs = {
    #                 'class': 'form-control',
    #                 'placeholder': 'Ingrese su apellido',
    #             }
    #         ),
    #         'cedula': forms.TextInput(
    #             attrs = {
    #                 'class': 'form-control',
    #                 'placeholder': 'Ingrese su número de documento',
    #             }
    #         ),
    #         'password': forms.PasswordInput(
    #             attrs = {
    #                 'class': 'form-control',
    #                 'placeholder': 'Ingrese una contraseña',
    #             }
    #         ),
    #         'fecha_nac': forms.TextInput(
    #             attrs = {
    #                 'class': 'form-control',
    #                 'placeholder': 'Ingrese fecha de nacimiento',
    #             }
    #         ),
    #         'ciudad': forms.TextInput(
    #             attrs = {
    #                 'class': 'form-control',
    #                 'placeholder': 'Ingrese su ciudad de residencia',
    #             }
    #         ),
    #     }

# class InfoProfileForm(forms.ModelForm):
#     class Meta():
#         model = Usuario
#         fields=('nombre', 'apellido', 'edad', 'cedula','ciudad', 'fechanac')
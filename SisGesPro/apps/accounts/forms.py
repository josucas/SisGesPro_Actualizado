from django import forms
from .models import Usuario
from django.contrib.auth.forms import UserCreationForm, UserChangeForm


class RegistrationForm(UserCreationForm):

	class Meta:
		model = Usuario
		fields = [
				'ci',
                'nombre',
                'apellido',
                'correo',
                'telefono',
                'sexo',
                'estado',
                'rol',
			]

		labels = {
            'ci': 'Cedula',
            'nombre': 'Nombre',
            'apellido': 'Apellido',
            'correo': 'Correo Electrónico',
            'telefono': 'Telefono',
            'sexo': 'Sexo',
            'estado' : 'Estado',
            'rol': 'Rol'
		}
        

class EditProfileForm(UserChangeForm):
    
    class Meta:
        model = Usuario
        fields = (
            'ci',
            'nombre',
            'apellido',
            'correo',
            'telefono',
            'sexo',
        )

class EditCountForm(UserChangeForm):
    class Meta:
        model = Usuario
        fields = (
            'ci',
            'nombre',
            'apellido',
            'correo',
            'telefono',
            'sexo',
            'estado',
            'rol',
        )

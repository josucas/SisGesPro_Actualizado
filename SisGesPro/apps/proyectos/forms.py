from django import forms
from .models import Proyecto, UserStory
from django.contrib.auth.forms import UserCreationForm, UserChangeForm 


class RegistroProyectoForm(forms.ModelForm):

	class Meta:
		model = Proyecto
		fields = [                
            'codigo',
            'nombre',
            'descripcion',
            'integrantes',
            'fecha_inicio',
            'fecha_estimada',
        ]

		labels = {
            'codigo':'Codigo',
            'nombre':'Nombre del proyecto',
            'descripcion':'Descripcion',
            'integrantes':'Integrantes',
            'fecha_inicio':'Fecha inicio',
            'fecha_estimada':'Fecha estimada',
		}
       
class EditProyectoForm(forms.ModelForm):
    
    class Meta:
        model = Proyecto
        fields = (
            'codigo',
            'nombre',
            'descripcion',
            'integrantes',
            'fecha_inicio',
            'fecha_estimada',
            'estado',
        )
        labels = {
            'codigo':'Codigo',
            'nombre':'Nombre del proyecto',
            'descripcion':'Descripcion',
            'integrantes':'Integrantes',
            'fecha_inicio':'Fecha inicio',
            'fecha_estimada':'Fecha estimada',
            'estado':'Estado',
		}

        
class RegistroUSForm(forms.ModelForm):

    def __init__(self,*args,**kwargs):
        super(RegistroUSForm, self).__init__(*args, **kwargs)
        self.fields['proyecto'].widget.attrs['readonly'] = True

    class Meta:
        model = UserStory
        fields = [                
            'proyecto',
            'codigo',
            'nombre',
            'descripcion',
        ]
        labels = {
            'proyecto':'Codigo del proyecto',
            'codigo':'Codigo',
            'nombre': 'Nombre del User Story',
            'descripcion':'Descripcion',
		}

        
class EditUSForm(forms.ModelForm):

    class Meta:
        model = UserStory
        fields = [
            'codigo',
            'nombre',
            'descripcion',
        ]
        labels = {
            'codigo':'Codigo',
            'nombre': 'Nombre del User Story',
            'descripcion':'Descripcion',
		}
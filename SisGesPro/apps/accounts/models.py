from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser,
    BaseUserManager
)
# Create your models here.

class UserManager(BaseUserManager):
    #crea y guarda a un usuario con el correo y contraseña dadas
    def create_user(self, correo, password = None):
        if not correo:
            raise ValueError('Los Usuarios deben tener un correo electrónico válido')
        usuario = self.model(correo = self.normalize_email(correo),)
        usuario.set_password(password)
        usuario.save(using = self._db)
        return usuario
    
    #crea y guarda a un usuario super_usuario
    def create_superuser(self, correo, password):
        usuario = self.create_user(correo, password = password)
        usuario.is_superuser = True
        usuario.save(using = self._db)
        return usuario

class Usuario(AbstractBaseUser):
    ci = models.CharField(
        max_length = 8,
        primary_key = True,
        unique = True,
        blank = True,
    )

    correo = models.EmailField(
        max_length = 100,
        blank = True,
        unique = True
    )

    nombre = models.CharField(
        max_length = 30,
        blank = True
    )

    apellido = models.CharField(
        max_length = 30,
        blank = False
    )
    
    telefono =  models.CharField(
        max_length = 12
    )

    sexo = models.CharField(
        max_length = 1,
        choices = (
            ('F', 'Femenino'),
            ('M', 'Masculino')
        ),
        default = 'M'
    )
    
    estado = models.CharField(
        max_length = 1,
        choices = (
            ('A', 'Activo'),
            ('D', 'Despedido'),
            ('J', 'Jubilado'),
            ('R', 'Receso'),
        ),
        default = 'A'
    )

    fecha_creado = models.DateTimeField(
        auto_now_add = True
    )

    is_active = models.BooleanField(
        default = True
    )
    
    is_staff = models.BooleanField(
        default = True
    )

    rol = models.CharField(
        max_length = 1,
        choices = (
            ('A', 'Administrador'),
            ('D', 'Developer'),
            ('P', 'ProductOwner'),
            ('S', 'ScrumMaster'),
        ),
        default = 'A'
    )

    #Establecer manejador del modelo (definido en el siguiente paso)
    object = UserManager()

    USERNAME_FIELD = 'correo'
    REQUIRED_FIELDS = []

    class Meta:
        db_table = 'Usuarios'      
        verbose_name = ('usuario')
        verbose_name_plural = ('usuarios')

    def get_full_name(self):
        return self.nombre +' '+ self.apellido

    def get_short_name(self):
        return self.nombre

    def __str__(self):
        return self.nombre + ' ' + self.apellido + ' ' + self.correo

    def get_rol(self):
        if (self.rol == 'A'):
            return 'Administrador'
        elif (self.rol == 'D'):
            return 'Developer'
        elif (self.rol == 'P'):
            return 'ProductOwner'
        else:
            return 'ScrumMaster'


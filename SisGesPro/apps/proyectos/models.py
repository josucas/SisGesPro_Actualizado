from django.db import models
from apps.accounts.models import Usuario
from django.contrib.postgres.fields import ArrayField, JSONField
# Create your models here.

class Proyecto(models.Model):
    codigo = models.CharField(
        primary_key = True,
        unique = True,
        max_length = 4,
        blank = True
    )
    nombre = models.CharField(
        max_length = 50
    )
    descripcion = models.TextField(
        max_length=150
    )
    integrantes = models.ManyToManyField(
        Usuario
    )
    fecha_inicio = models.DateField(
        blank = True,
        null = True
    )
    fecha_estimada = models.DateField(
        blank = True,
        null = True
    )
    estado = models.CharField(
        max_length = 1,
        choices = (
            ('1', 'Pendiente'),
            ('2', 'En curso'),
            ('3', 'Cancelado'),
            ('4', 'Terminado'),
            ('5', 'En revision'),
            ('6', 'Aprovado')
        ),
        default = '1'
    )
    fecha_creado = models.DateTimeField(
        auto_now_add = True
    )
    
    class Meta:   
        db_table = 'Proyectos'      
        verbose_name = ('proyecto')
        verbose_name_plural = ('proyectos')

    def __str__(self):
        return self.codigo + ' ' + self.nombre + ' ' + self.estado

    def get_estado(self):
        if self.estado == '1':
            return 'Pendiente'
        elif self.estado == '2':
            return 'En curso'
        elif self.estado == '3':
            return 'Cancelado'
        elif self.estado == '4':
            return 'Terminado'
        elif self.estado == '5':
            return 'En revision'
        else:
            return 'Aprobado'
    
    def get_integrantes(self):
        return self.integrantes

class UserStory(models.Model):
    codigo = models.CharField(
        max_length = 4,
        blank = True
    )
    proyecto = models.CharField(
        max_length = 4,
        blank = True
    )
    nombre = models.CharField(
        unique = True,
        max_length = 30,
        blank = True
    )
    descripcion = models.TextField(max_length = 300, blank=True)
    duracion_estimada = models.IntegerField(blank=True, null=True)
    prioridad = models.CharField(
        max_length = 1,
        choices = (
            ('A', 'Alta'),
            ('M', 'Media'),
            ('B', 'Baja')
        ),
        default = 'B')
    estado = models.CharField(
        max_length = 1,
        choices = (
            ('1', 'Do'),
            ('2', 'Doing'),
            ('3', 'Done')
        ),
        default = '1')
    
    class Meta:  
        db_table = 'UserStorys'      
        verbose_name = ('requisito')
        verbose_name_plural = ('requisitos')
        unique_together = (("codigo", "proyecto"),)
    
    def __str__(self):
        return self.codigo + ' ' + self.nombre + ' ' + self.estado

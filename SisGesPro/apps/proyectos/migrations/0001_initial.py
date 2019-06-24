# Generated by Django 2.1.7 on 2019-05-01 14:20

from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Proyecto',
            fields=[
                ('codigo', models.CharField(blank=True, max_length=4, primary_key=True, serialize=False, unique=True)),
                ('nombre', models.CharField(max_length=50)),
                ('descripcion', models.TextField(max_length=150)),
                ('fecha_inicio', models.DateField(blank=True, null=True)),
                ('fecha_estimada', models.DateField(blank=True, null=True)),
                ('estado', models.CharField(choices=[('1', 'Pendiente'), ('2', 'En curso'), ('3', 'Cancelado'), ('4', 'Terminado'), ('5', 'En revision'), ('6', 'Aprovado')], default='1', max_length=1)),
                ('fecha_creado', models.DateTimeField(auto_now_add=True)),
                ('integrantes', models.ManyToManyField(to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'verbose_name': 'proyecto',
                'verbose_name_plural': 'proyectos',
                'db_table': 'Proyectos',
            },
        ),
        migrations.CreateModel(
            name='UserStory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(blank=True, max_length=4)),
                ('proyecto', models.CharField(blank=True, max_length=4)),
                ('nombre', models.CharField(blank=True, max_length=30, unique=True)),
                ('descripcion', models.TextField(blank=True, max_length=300)),
                ('duracion_estimada', models.IntegerField(blank=True, null=True)),
                ('prioridad', models.CharField(choices=[('A', 'Alta'), ('M', 'Media'), ('B', 'Baja')], default='B', max_length=1)),
                ('estado', models.CharField(choices=[('1', 'Do'), ('2', 'Doing'), ('3', 'Done')], default='1', max_length=1)),
            ],
            options={
                'verbose_name': 'requisito',
                'verbose_name_plural': 'requisitos',
                'db_table': 'UserStorys',
            },
        ),
        migrations.AlterUniqueTogether(
            name='userstory',
            unique_together={('codigo', 'proyecto')},
        ),
    ]

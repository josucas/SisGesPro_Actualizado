from django.conf.urls import url
from django.conf import settings
from django.contrib.auth.views import LoginView, LogoutView, login_required
from . import views
from django.contrib.auth.views import (
    PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView, PasswordResetCompleteView
)

urlpatterns = [
    url(r'^$', views.view_proyectos, name='view_proyectos'),
    url(r'^list', views.view_table, name='view_table'),
    url(r'^register/$', views.RegistroProyectos.as_view(), name='register'),
    url(r'^(?P<pk>\d+)/edit/$', login_required(views.EditProyectos.as_view()), name='edit_proyecto'),
    url(r'^(?P<pk>\d+)/productBacklog/$', views.view_product, name='view_product'),
    url(r'^(?P<pk>\d+)/productBacklog/registerUS/$', views.registar_us, name='registerUS'),
    url(r'^(?P<pk>\d+)/productBacklog/(?P<ustory>\d+)/editUS/$', views.editar_us, name='editUS'),
]
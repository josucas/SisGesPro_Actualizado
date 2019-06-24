from django.conf.urls import url
from django.conf import settings
from django.contrib.auth.views import LoginView, LogoutView, login_required
from . import views
from django.contrib.auth.views import (
    PasswordResetView, PasswordResetDoneView, PasswordResetConfirmView, PasswordResetCompleteView
)

urlpatterns = [
    url(r'^$', views.view_counts, name="view_counts"),
    url(r'^login/$', LoginView.as_view(template_name = 'accounts/login.html'), name="login"),
    url(r'^logout/$', LogoutView.as_view(next_page = settings.LOGOUT_REDIRECT_URL), name="logout"),
    url(r'^register/$', views.RegistroUsuario.as_view(), name='register'),
    url(r'^(?P<pk>\d+)/edit/$', login_required(views.UsuarioUpdate.as_view()), name='edit_account'),
    url(r'^profile/$', views.view_profile, name='view_profile'),
    url(r'^profile/edit/$', views.edit_profile, name='edit_profile'),
    #-----------------------------------------------
    url(r'^change-password/$', views.change_password, name='change_password'),
    url(r'^reset-password/$', PasswordResetView, name='reset_password'),
    url(r'^reset-password/done/$', PasswordResetDoneView, name='password_reset_done'),
    url(r'^reset-password/done/confirm/(?P<uidb64>[0-9A-Za-z]+)-(?P<token>.+)$', PasswordResetConfirmView, name='password_reset_confirm'),
    url(r'^reset-password/complete/$', PasswordResetCompleteView, name='password_reset_complete')
]
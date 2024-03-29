"""SisGesPro URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
#from django.contrib import admin
from django.conf.urls import url, include
from django.shortcuts import render

def index(request):
	return render(request, 'index.html')
def mision(request):
	return render(request, 'home/mision.html')
def vision(request):
	return render(request, 'home/vision.html')

urlpatterns = [
    #url(r'^admin/', admin.site.urls),
    url(r'^$', index, name = 'home'),
    url(r'^mision/$', mision, name="mision"),
    url(r'^vision/$', vision, name="vision"),
    url(r'^accounts/', include(('apps.accounts.urls','accounts'), namespace='accounts')),
    url(r'^proyectos/', include(('apps.proyectos.urls','proyectos'), namespace='proyectos')),
]


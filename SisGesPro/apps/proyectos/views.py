from django.shortcuts import render, redirect, reverse
from django.views.generic import ListView, CreateView, UpdateView, DeleteView
from .models import Proyecto, UserStory
from .forms import RegistroProyectoForm, EditProyectoForm, RegistroUSForm, EditUSForm
from django.urls import reverse_lazy
from .tables import UsTable
from django_tables2.config import RequestConfig
# Create your views here.


def view_proyectos(request):
    return render(request, 'proyectos/lista.html', {
        'proyectos': Proyecto.objects.all()
    })

def view_table(request):
    table = UsTable(UserStory.objects.all())
    RequestConfig(request).configure(table)
    return render(request, 'proyectos/lista_us.html', {'table': table})

def view_product(request, pk):
    return render(request, 'proyectos/product.html', {
        'productBacklog': UserStory.objects.filter(proyecto = pk),
        'proyecto': pk
    })

def registar_us(request, pk):
    if request.method =='POST':
        form = RegistroUSForm(request.POST)
        if form.is_valid():
            form.save()
            return render(request, 'proyectos/product.html', {
                'productBacklog': UserStory.objects.filter(proyecto = pk),
                'proyecto': pk
            })
    else:
        form = RegistroUSForm(initial={'proyecto': pk})
        return render(request, 'proyectos/reg_us.html',  {'form': form})

def editar_us(request, pk=None, ustory=None):
    if request.method == 'POST':
        form = EditUSForm(request.POST, instance=UserStory.objects.get(codigo = ustory, proyecto = pk))
        if form.is_valid():
            form.save()
            return redirect(reverse('proyectos:view_proyectos'))
    else:
        form = EditUSForm(instance=UserStory.objects.get(codigo = ustory, proyecto = pk))
        args = {'form': form}
        return render(request, 'proyectos/edit_us.html', args)


class EditUS(UpdateView):
	model = UserStory
	form_class = EditUSForm
	template_name = 'proyectos/edit_us.html'
	success_url = reverse_lazy('proyectos:view_proyectos')

class RegistroProyectos(CreateView):
	model = Proyecto
	form_class = RegistroProyectoForm
	template_name = 'proyectos/reg_form.html'
	success_url = reverse_lazy('proyectos:view_proyectos')

class EditProyectos(UpdateView):
	model = Proyecto
	form_class = EditProyectoForm
	template_name = 'proyectos/edit_proyecto.html'
	success_url = reverse_lazy('proyectos:view_proyectos')

def edit_profile(request, pk):
    if request.method == 'GET':
	    form = EditProyectoForm(instance= Proyecto.objects.get(codigo=pk))
    else:
        form = EditProyectoForm(request.POST, instance= Proyecto.objects.get(codigo=pk))
        if form.is_valid():
            form.save()
        return redirect('proyectos:view_proyectos')
    return render(request, 'proyectos/editing_proyecto.html', {'form':form})


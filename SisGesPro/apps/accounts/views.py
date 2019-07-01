
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views.generic import CreateView
from django.urls import reverse_lazy
from django.views.generic import ListView, CreateView, UpdateView, DeleteView

from .forms import (
    RegistrationForm,
    EditProfileForm,
    EditCountForm
)

from .models import Usuario
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserChangeForm, PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.decorators import login_required

class RegistroUsuario(CreateView):
	model = Usuario
	template_name = "accounts/reg_form.html"
	form_class = RegistrationForm
	success_url = reverse_lazy('accounts:view_counts')

class UsuarioUpdate(UpdateView):
	model = Usuario
	template_name = 'accounts/edit_account.html'
	form_class = EditCountForm
	success_url = reverse_lazy('accounts:view_counts')

def view_counts(request):
    return render(request, 'accounts/lista.html', {
        'usuarios': Usuario.object.all()
    })

def view_profile(request, pk = None):
    if pk:
        return render(request, 'accounts/profile.html', {
            'user': Usuario.object.get(pk=pk)
        })
    else:
        return render(request, 'accounts/profile.html', {
            'user': request.user
        })

def edit_account(request, id):
	usuario = Usuario.object.get(ci = id)
	if request.method == 'GET':
		form = EditCountForm(instance = usuario)
	else:
		form = EditCountForm(request.POST, instance = usuario)
		if form.is_valid():
			form.save()
		return redirect('accounts:view_counts')
	return render(request, 'accounts/edit_account.html', {'form':form})

def register(request):
    if request.method =='POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect(reverse('accounts:home'))

    else:
        form = RegistrationForm()

        args = {'form': form}
        return render(request, 'accounts/reg_form.html',  {
            'form': args
        })
  

def edit_profile(request):
    if request.method == 'POST':
        form = EditProfileForm(request.POST, instance=request.user)

        if form.is_valid():
            form.save()
            return redirect(reverse('accounts:view_profile'))
    else:
        form = EditProfileForm(instance=request.user)
        args = {'form': form}
        return render(request, 'accounts/edit_profile.html', args)

def change_password(request):
    if request.method == 'POST':
        form = PasswordChangeForm(data=request.POST, user=request.user)

        if form.is_valid():
            form.save()
            update_session_auth_hash(request, form.user)
            return redirect(reverse('accounts:view_profile'))
        else:
            return redirect(reverse('accounts:change_password'))
    else:
        form = PasswordChangeForm(user=request.user)

        args = {'form': form}
        return render(request, 'accounts/change_password.html', args)


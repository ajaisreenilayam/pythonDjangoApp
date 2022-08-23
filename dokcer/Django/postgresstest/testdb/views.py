from .models import namedb
from django import forms
from .forms import NewForm
from django.shortcuts import render, redirect
from django.apps import apps

def list(request):
    items = namedb.objects.all()
    print("Myoutput",items)
    return render(request,'list.html',{'items': items})    
    #return render(request, 'list.html')

def newentry(request):
    if request.method == 'GET':
        return render(request, 'new.html')
    if request.method == 'POST':
        form = NewForm(request.POST)
        if form.is_valid():
            cd = form.cleaned_data
            pc = namedb(
                id = cd['id'],
                firstname = cd['firstname'],
                lastname = cd['lastname'],
                age = cd['age']
            )            
            pc.save()
        return redirect('list')
from django import forms

class NewForm(forms.Form):
    id = forms.IntegerField()
    firstname = forms.CharField(max_length=80)
    lastname = forms.CharField(max_length=80)
    age = forms.IntegerField()
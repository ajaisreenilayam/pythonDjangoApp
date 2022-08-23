from django.db import models

# Create your models here.
class namedb(models.Model):
    id = models.IntegerField(primary_key=True)
    firstname = models.CharField(max_length=80)
    lastname = models.CharField(max_length=80)
    age = models.IntegerField()
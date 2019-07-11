from django.db import models

# Create your models here.

class Addcat(models.Model):
	catid = models.AutoField(primary_key=True)
	catnm=models.CharField(max_length=50)
	caticon=models.CharField(max_length=100)

class Addsubcat(models.Model):
	subcatid = models.AutoField(primary_key=True)
	subcatnm=models.CharField(max_length=50)
	catnm=models.CharField(max_length=50)
	subcaticon=models.CharField(max_length=1000)


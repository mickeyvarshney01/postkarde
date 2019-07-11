from django.db import models

# Create your models here.
class Addpost(models.Model):
	adsid = models.AutoField(primary_key=True)
	uid=models.CharField(max_length=100)
	adstitle=models.CharField(max_length=100)
	adssubcat=models.CharField(max_length=50)
	adsdescription=models.CharField(max_length=100)
	adsprice=models.CharField(max_length=100)
	file1=models.CharField(max_length=100)
	file2=models.CharField(max_length=100)
	file3=models.CharField(max_length=100)
	file4=models.CharField(max_length=100)
	adscity=models.CharField(max_length=50)
	bstatus=models.IntegerField()
	status=models.IntegerField()
	
class Payment(models.Model):
	txnid = models.AutoField(primary_key=True)
	uid=models.CharField(max_length=100)
	adsid=models.CharField(max_length=100)
	adsprice=models.CharField(max_length=100)
	ptime=models.CharField(max_length=100)
	
class Bidding(models.Model):
	bidid = models.AutoField(primary_key=True)
	uid=models.CharField(max_length=100)
	adsid=models.IntegerField()
	nprice=models.CharField(max_length=50)
	btime=models.CharField(max_length=500)
	
class Feedback(models.Model):
	feedid = models.AutoField(primary_key=True)
	#uid=models.CharField(max_length=100)
	feednm=models.CharField(max_length=100)
	feedarea=models.CharField(max_length=1000)

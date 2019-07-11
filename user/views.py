from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from . import models
from myadmin import models as adminmodel
from myapp import models as mainmodel
from time import *
from django.db.models import Q

curl=settings.CURRENT_URL
media_url=settings.MEDIA_URL

#middleware to check session for admin routes
def sessioncheckuser_middleware(get_response):
	def middleware(request):
		if request.path=='/user/' or request.path=='/user/editprofileuser':
			if request.session['sunm']==None or request.session['srole']!='user' :
				response = redirect(curl+'login/')
			else:
				response = get_response(request)
		else:
			response = get_response(request)		
		return response	
	return middleware


# Create your views here.

def home(request):
	return render(request,"userhome.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole']})

def editprofileuser(request):
	sunm=request.session['sunm']
	if request.method=='GET':
		userdetails=mainmodel.Register.objects.filter(email=sunm)
	
		f=''
		m=''
		if userdetails[0].gender=='male':
			m='checked'
		else:
			f='checked'
		return render(request,"editprofileuser.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole'],'userdetails':userdetails[0],'m':m,'f':f})
	else:
		myname=request.POST.get('name')
		email=request.POST.get('email')
		password=request.POST.get('password')
		address=request.POST.get('address')
		city=request.POST.get('city')
		gender=request.POST.get('gender')
		mobile=request.POST.get('mobile')
		dob=request.POST.get('dob')
		p=mainmodel.Register.objects.filter(email=email).update(name=myname,password=password,address=address,city=city,mobile=mobile,dob=dob,gender=gender)
		return redirect(curl+'login/')
		
	
	
def addproduct(request):
	subclist=adminmodel.Addsubcat.objects.filter()
	if request.method=='GET':
		return render(request,"addproduct.html",{'subclist':subclist,'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole'],'output':''})
	else:
		uid=request.POST.get('uid')
		adstitle=request.POST.get('adstitle')
		adssubcat=request.POST.get('adssubcat')
		adsdescription=request.POST.get('adsdescription')
		adsprice=request.POST.get('adsprice')
		adscity=request.POST.get('adscity')
		bstatus=request.POST.get('chk')
		if bstatus==None:
			bstatus=0		
		print(bstatus)
		status=request.POST.get('status')
		
		fs = FileSystemStorage()
		if 'file1' in request.FILES.keys():
			file1=request.FILES['file1']
			file1_name = fs.save(file1.name,file1)
		else:
			file1_name="logo.png"
			
		if 'file2' in request.FILES.keys():
			file2=request.FILES['file2']
			file2_name = fs.save(file2.name,file2)
		else:
			file2_name="logo.png"
			
		if 'file3' in request.FILES.keys():
			file3=request.FILES['file3']
			file3_name = fs.save(file3.name,file3)
		else:
			file3_name="logo.png"
			
		if 'file4' in request.FILES.keys():
			file4=request.FILES['file4']
			file4_name = fs.save(file4.name,file4)
		else:
			file4_name="logo.png"				
		
		p=models.Addpost(uid=uid,adstitle=adstitle,adssubcat=adssubcat,adsdescription=adsdescription,adsprice=adsprice,file1=file1_name,file2=file2_name,file3=file3_name,file4=file4_name,adscity=adscity,bstatus=bstatus,status=0)
		p.save()
		return render(request,"addproduct.html",{'subclist':subclist,'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole'],'output':'Post Added successfully'})
		
		
def buyproduct(request):
	paypalURL = 'https://www.sandbox.paypal.com/cgi-bin/webscr'; 
	paypalID = 'harrybhilai250-myseller@gmail.com';
	adsid=request.session['adsid']
	plist=models.Addpost.objects.filter(adsid=adsid)
	return render(request,"buyproduct.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole'],'adsid':adsid,'adsprice':plist[0].adsprice,'paypalURL':paypalURL,'paypalID':paypalID})		
		
		
def payment(request):
	uid=request.GET.get('uid')
	adsid=request.GET.get('adsid')	
	adsprice=request.GET.get('adsprice')
	ptime=strftime("%d/%m/%Y,%H:%M:%S,%A")
	p=models.Payment(uid=uid,adsid=adsid,adsprice=adsprice,ptime=ptime)
	p.save()
	return redirect(curl+'user/')		
	
def managebidding(request):
	sunm=request.session['sunm']
	plist=models.Addpost.objects.filter(~Q(uid=sunm),bstatus=1)
	return render(request,"managebidding.html",{'curl':curl,'plist':plist,'media_url':media_url})		
	
def bidding(request):
	sunm=request.session['sunm']
	if request.method=='GET':
		adsid=request.GET.get('adsid')
		bdetails=models.Bidding.objects.filter(adsid=adsid,uid=sunm)
		pdetails=models.Addpost.objects.filter(adsid=adsid)
		if len(bdetails)>0:
			hprice=bdetails[0].nprice
			for i in range(0,len(bdetails)-1):
				if bdetails[i].nprice < bdetails[i+1].nprice:
					hprice=bdetails[i+1].nprice					
		else:
			hprice=pdetails[0].adsprice

		return render(request,"bidding.html",{'curl':curl,'pdetails':pdetails,'media_url':media_url,'sunm':request.session['sunm'],'hprice':hprice})
	else:
		uid=request.POST.get('uid')
		adsid=request.POST.get('adsid')				
		nprice=request.POST.get('nprice')
		p=models.Bidding(uid=uid,adsid=adsid,nprice=nprice,btime=time())
		p.save()
		return redirect(curl+'user/managebidding/')			

def viewbid(request):
	sunm=request.session['sunm']
	vlist=models.Addpost.objects.filter(uid=sunm,bstatus=1)
	adsid=vlist[0].adsid
	blist=models.Bidding.objects.filter(adsid=adsid)
	return render(request,"viewbidding.html",{'curl':curl,'vlist':vlist,'blist':blist,'media_url':media_url})		
		
def feedback(request):
	sunm=request.session['sunm']
	if request.method=='GET':
		return render(request,"feedback.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole']})
	else:
		feednm=request.POST.get('feednm')
		feedarea=request.POST.get('feedarea')
		p=models.Feedback(feednm=feednm,feedarea=feedarea)
		p.save()
		return redirect(curl+'user/feedback/')
		
def manageproduct(request):
	sunm=request.session['sunm']
	manpro=models.Addpost.objects.filter(uid=sunm)
	return render(request,"manageproduct.html",{'curl':curl,'manpro':manpro,'media_url':media_url})
	
def manageproductstatus(request):
	adsid=request.GET.get('adsid')
	status=request.GET.get('status')
	if status=='block':
		models.Addpost.objects.filter(adsid=adsid).update(status=0)
	elif status=='unblock':
		models.Addpost.objects.filter(adsid=adsid).update(status=1)	         
	else:
		models.Addpost.objects.filter(adsid=adsid).delete()
	return redirect(curl+'user/manageproduct/')		
		
def userhome(request):
	return render(request,"userhome.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole']})
		

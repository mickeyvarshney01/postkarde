from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.conf import settings
from django.core.files.storage import FileSystemStorage
from user import models as usermodel
from . import models
from myapp import models as m

curl=settings.CURRENT_URL

#middleware to check session for admin routes
def sessioncheck_middleware(get_response):
	def middleware(request):
		if request.path=='/myadmin/' or request.path=='/myadmin/manageusers/' or request.path=='/myadmin/addcat/':
			if request.session['sunm']==None or request.session['srole']!="admin":
				response = redirect(curl+'login/')
			else:
				response = get_response(request)
		else:
			response = get_response(request)		
		return response	
	return middleware


# Create your views here.


def adminhome(request):
	return render(request,"adminhome.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole']})
	
def addcat(request):
	if request.method=="GET":
		return render(request,"addcat.html",{'curl':curl,'output':'','sunm':request.session['sunm'],'srole':request.session['srole']})	
	else:
		catnm=request.POST.get('catnm')
		caticon=request.FILES['caticon']
		fs = FileSystemStorage()
		filename = fs.save(caticon.name,caticon)
		p=models.Addcat(catnm=catnm,caticon=filename)
		p.save()
		return render(request,"addcat.html",{'curl':curl,'output':'Category added successfully','sunm':request.session['sunm'],'srole':request.session['srole']})
		
def addsubcat(request):
	clist=models.Addcat.objects.filter()
	if request.method=="GET":
		return render(request,"addsubcat.html",{'curl':curl,'output':'','clist':clist})	
	else:
		catnm=request.POST.get('catnm')
		subcatnm=request.POST.get('subcatnm')
		subcaticon=request.FILES['subcaticon']
		fs = FileSystemStorage()
		filename = fs.save(subcaticon.name,subcaticon)
		p=models.Addsubcat(subcatnm=subcatnm,catnm=catnm,subcaticon=filename)
		p.save()
		return render(request,"addsubcat.html",{'curl':curl,'output':'Sub Category added successfully','clist':clist})		
	

def manageusers(request):
	userlist=m.Register.objects.filter(role='user')
	return render(request,"manageusers.html",{'curl':curl,'userlist':userlist})
	
def manageuserstatus(request):
	regid=request.GET.get('regid')
	vstatus=request.GET.get('vstatus')
	if vstatus=='block':
		m.Register.objects.filter(regid=regid).update(status=0)
	elif vstatus=='unblock':
		m.Register.objects.filter(regid=regid).update(status=1)	         
	else:
		m.Register.objects.filter(regid=regid).delete()
	return redirect(curl+'myadmin/manageusers')	
		
def viewuserpost(request):
	userpost=usermodel.Addpost.objects.filter()
	return render(request,"viewuserpost.html",{'curl':curl,'userpost':userpost})

def viewuserpoststatus(request):
	adsid=request.GET.get('adsid')
	status=request.GET.get('status')
	if status=='block':
		usermodel.Addpost.objects.filter(adsid=adsid).update(status=0)
	elif status=='unblock':
		usermodel.Addpost.objects.filter(adsid=adsid).update(status=1)	         
	else:
		usermodel.Addpost.objects.filter(adsid=adsid).delete()
	return redirect(curl+'myadmin/viewuserpost')	

def managecategory(request):
	managecat=models.Addcat.objects.filter()
	return render(request,"managecategory.html",{'curl':curl,'managecat':managecat})

def managesubcate(request):
	managesubcate=models.Addsubcat.objects.filter()
	return render(request,"managesubcate.html",{'curl':curl,'managesubcate':managesubcate})

def paymenthis(request):
	paylist=usermodel.Payment.objects.filter()
	return render(request,"paymenthis.html",{'curl':curl,'paylist':paylist})

def vfeedback(request):
	feedlist=usermodel.Feedback.objects.filter()
	return render(request,"vfeedback.html",{'curl':curl,'feedlist':feedlist})

def managesubcatstatus(request):
	subcatid=request.GET.get('subcatid')
	status=request.GET.get('status')
	if status=='block':
		usermodel.Addpost.objects.filter(adsid=adsid).update(status=0)
	elif status=='unblock':
		usermodel.Addpost.objects.filter(adsid=adsid).update(status=1)	         
	else:
		usermodel.Addsubcat.objects.filter(subcatid=subcatid).delete()
	return redirect(curl+'myadmin/managesubcate')

def managecatstatus(request):
	catid=request.GET.get('catid')
	status=request.GET.get('status')
	if status=='block':
		usermodel.Addpost.objects.filter(adsid=adsid).update(status=0)
	elif status=='unblock':
		usermodel.Addpost.objects.filter(adsid=adsid).update(status=1)	         
	else:
		usermodel.Addcat.objects.filter(catid=catid).delete()
	return redirect(curl+'myadmin/managecategory')	

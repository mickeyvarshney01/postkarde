from django.http import HttpResponse
from django.shortcuts import render,redirect
from django.conf import settings
from . import models
from myadmin import models as m
from user import models as usermodel


curl=settings.CURRENT_URL
media_url=settings.MEDIA_URL

#session unset
def sessionunset_middleware(get_response):
	def middleware(request):
		if request.path=='/login/' or request.path=='/home/'  or request.path=='/about/' or request.path=='/contact/' or request.path=='/service/' or request.path=='/register/':
			request.session['sunm']=None
			request.session['srole']=None
		response = get_response(request)
		return response

	return middleware



def home(request):
	catlist=m.Addcat.objects.filter()
	return render(request,"home.html",{'curl':curl,'catlist':catlist,'media_url':media_url})

def about(request):
	#Set useful variables for paypal form
	#Test PayPal API URL
	paypalURL = 'https://www.sandbox.paypal.com/cgi-bin/webscr'; 
	#Business Email
	paypalID = 'harrybhilai250-myseller@gmail.com'; 
	pname='mobile'
	pprice=1000
	return render(request,"about.html",{'curl':curl,'paypalURL':paypalURL,'paypalID':paypalID,'pname':pname,'pprice':pprice})

def cancel(request):
	return HttpResponse("<h1>Payment failed</h1>")
	
def success(request):
	return HttpResponse("<h1>Payment done.....</h1>")	

	
def contact(request):
	response=render(request,"contact.html",{'curl':curl})
	response.set_cookie('cunm','admin',3600)
	response.set_cookie('cpass','admin123')
	
	print(request.COOKIES.get('cunm'))
	
	return response
	
	
def buylogin(request):
	if request.method=='GET':
		adsid=request.GET.get('adsid')
		return render(request,"buylogin.html",{'curl':curl,'adsid':adsid})	
	else:
		email=request.POST.get("email")
		password=request.POST.get("password")
		adsid=request.POST.get("adsid")
		userData=models.Register.objects.filter(email=email,password=password,status=1)
		if len(userData)>0:
		
			#code to set session data
			request.session['sunm']=email
			request.session['srole']=userData[0].role
			request.session['adsid']=adsid
			
			if userData[0].role=="user":
				myurl=curl+'user/buyproduct/'
				return redirect(myurl)
			if userData[0].role=="admin":
				myurl=curl+'myadmin/'
				return redirect(myurl)	
		else:	
			return render(request,"buylogin.html",{'curl':curl,'output':'invalid user please login ,or verify account'})
			
		
		
def service(request):
	return render(request,"service.html",{'curl':curl})

def register(request):
	if request.method=='GET':
		if request.GET.get('output')==None:
			output=""
		else:
			output=request.GET.get('output')	
		return render(request,"register.html",{'curl':curl,'output':output})
	else:
		name=request.POST.get('name')
		email=request.POST.get('email')
		password=request.POST.get('password')
		address=request.POST.get('address')
		city=request.POST.get('city')
		gender=request.POST.get('gender')
		mobile=request.POST.get('mobile')
		dob=request.POST.get('dob')
		p=models.Register(name=name,email=email,password=password,address=address,city=city,mobile=mobile,dob=dob,gender=gender,role="user",status="0")
		p.save()	
		myurl=curl+'register/?output=Register successfully'	
		
		import smtplib 
		from email.mime.multipart import MIMEMultipart
		from email.mime.text import MIMEText
	
		me = "postkarde.com@gmail.com"
		you = email

		msg = MIMEMultipart('alternative')
		msg['Subject'] = "Verification Mail PostKrde.com"
		msg['From'] = me
		msg['To'] = you

		html = """<html>
  					<head></head>
  					<body>
    					<h1>Welcome to PostKrde.com</h1>
    					<p>You have successfully registered , please click on the link below to verify your account</p>
    					<h2>Username : """+email+"""</h2>
    					<h2>Password : """+str(password)+"""</h2>
    					<br>
    					<a href='http://localhost:8000/verify?vemail="""+email+"""' >Click here to verify account</a>		
  					</body>
				</html>
				"""
	
		s = smtplib.SMTP('smtp.gmail.com', 587) 
		s.starttls() 
		s.login("postkarde.com@gmail.com", "p@$tkarde") 
	
		part2 = MIMEText(html, 'html')

		msg.attach(part2)
	
		s.sendmail(me,you, str(msg)) 
		s.quit() 
		print("mail send successfully....")
		
		
		
		
		return redirect(myurl)
		#return render(request,"register.html",{'curl':curl,'output':'Register successfully'})


def verify(request):
	vemail=request.GET.get('vemail')
	models.Register.objects.filter(email=vemail).update(status=1)
	return redirect(curl+'login/')			
		

def login(request):
	cunm=""
	cpass=""
	if request.COOKIES.get('cunm')!=None:
		cunm=request.COOKIES.get('cunm')
		cpass=request.COOKIES.get('cpass')
		
	if request.method=="GET":
		return render(request,"login.html",{'curl':curl,'output':'','cunm':cunm,'cpass':cpass})
	else:
		email=request.POST.get("email")
		password=request.POST.get("password")
		chk=request.POST.get("chk")
		userData=models.Register.objects.filter(email=email,password=password,status=1)
		if len(userData)>0:
		
			#code to set session data
			request.session['sunm']=email
			request.session['srole']=userData[0].role
			
			if userData[0].role=="user":
				myurl=curl+'user/'
				response=redirect(myurl)
			if userData[0].role=="admin":
				myurl=curl+'myadmin/'
				response=redirect(myurl)
			
			if chk!=None:
				response.set_cookie('cunm',email,3600*24)
				response.set_cookie('cpass',password,3600*24)
			
			return response		
		else:	
			return render(request,"login.html",{'curl':curl,'cunm':cunm,'cpass':cpass,'output':'invalid user please login ,or verify account'})
	
def showsubcat(request):
	clist=m.Addcat.objects.filter()
	cnm=request.GET.get('cnm')
	subclist=m.Addsubcat.objects.filter(catnm=cnm)
	return render(request,"showsubcat.html",{'media_url':media_url,'curl':curl,'clist':clist,'subclist':subclist,'cnm':cnm})	
	
def viewads(request):
	scnm=request.GET.get('scnm')
	
	if request.GET.get('adscity')!=None:
		adslist=usermodel.Addpost.objects.filter(adssubcat=scnm,status=1,adscity=request.GET.get('adscity'))
	else:	
		adslist=usermodel.Addpost.objects.filter(adssubcat=scnm,status=1)
	
	totalads=len(adslist)
	return render(request,'viewads.html',{'media_url':media_url,'curl':curl,'scnm':scnm,'adslist':adslist,'totalads':totalads})	
	
	
	
	
	
	
	
	
	
	
	

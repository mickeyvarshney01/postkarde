from django.contrib import admin
from django.urls import path,include

from . import views

urlpatterns = [
    path('', views.adminhome),
    path('adminhome/',views.adminhome),
    path('addcat/',views.addcat),
    path('addsubcat/',views.addsubcat),
    path('manageusers/',views.manageusers),
    path('managecategory/',views.managecategory),
    path('managecatstatus/',views.managecatstatus),
    path('managesubcatstatus/',views.managesubcatstatus),
    path('managesubcate/',views.managesubcate),
    path('manageuserstatus/',views.manageuserstatus),
    path('viewuserpost/',views.viewuserpost),
    path('viewuserpoststatus/',views.viewuserpoststatus),
    path('paymenthis/',views.paymenthis),
    path('vfeedback/',views.vfeedback),

    
]

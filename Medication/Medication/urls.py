"""Medication URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from medapp import views

urlpatterns = [
    #admin
    path('admin/', admin.site.urls),
    #doctor
    path("", views.home, name="home"),
    path("doctor-login/", views.doctor_login, name="doctor_login"),
    path("doctor-signup/", views.doctor_signup, name="doctor_signup"),
    path("dr-view-appointments", views.dr_view_appointments, name="dr_view_appointments"),
    path("send-prescription", views.send_prescription, name="send_prescription"),
    path("doctor-logout", views.doctor_logout, name="doctor_logout"),
    path("doctor-accept", views.DoctorAccept, name="doctor_accept"),
    path("doctor-reject", views.DoctorReject, name="doctor_reject"),
    #user
    path("user-login/", views.user_login, name="user_login"),
    path("user-signup/", views.user_signup, name="user_signup"),
    path("book-appointment", views.book_appointment, name="book_appointment"),
    path("user-view-appointments", views.user_view_appointment, name="user_view_appointment"),
    path("user-logout", views.user_logout, name="user_logout"),
    #pharmacy
    path("pharmacy-login/", views.pharmacy_login, name="pharmacy_login"),
    path("pharmacy-signup/", views.pharmacy_signup, name="pharmacy_signup"),
    # path("decrypt-prescription", views.DecryptPrescription.as_view(), name="decrypt_prescription"),
    path("decrypt-prescription", views.decrypt_prescription, name="decrypt_prescription"),
    path("pharmacy-logout", views.pharmacy_logout, name="pharmacy_logout"),
]

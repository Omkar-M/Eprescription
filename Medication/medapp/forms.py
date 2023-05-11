from django import forms
from medapp.models import DoctorModel,PharmacyModel,PrescriptionModel

class DoctorForm(forms.Form):
    dr_name = forms.CharField(label='Doctor name', max_length=50)
    dr_education = forms.CharField(max_length=100, label='Doctor education')
    dr_email = forms.EmailField(max_length=50, label='Doctor email')
    dr_mobile = forms.CharField(max_length=14, label='Doctor mobile')
    dr_password = forms.CharField(max_length=500, label='Doctor password', widget=forms.PasswordInput())
    dr_address = forms.CharField(max_length=100, label='Doctor address')


class PharmacyForm(forms.Form):
    pharmacy_name = forms.CharField(label='Doctor name', max_length=50)
    pharmacy_email = forms.EmailField(max_length=50, label='Doctor email')
    pharmacy_mobile = forms.CharField(max_length=14, label='Doctor mobile')
    pharmacy_password = forms.CharField(max_length=500, label='Doctor password', widget=forms.PasswordInput())
    pharmacy_address = forms.CharField(max_length=100, label='Doctor address')

class PrescriptionForm(forms.Form):
    patient_name = forms.CharField(max_length=50, label='Patient name')
    patient_email = forms.EmailField(max_length=50, label='Patient email')
    patient_prescription = forms.CharField(max_length=1000, label='Patient prescription')
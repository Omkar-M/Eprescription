from django.contrib import admin
from .models import DoctorEducationModel,DoctorModel, PharmacyModel,PrescriptionModel, AppointmentModel
# Register your models here.
admin.site.register(DoctorEducationModel)
admin.site.register(DoctorModel)
admin.site.register(PharmacyModel)
admin.site.register(PrescriptionModel)
admin.site.register(AppointmentModel)
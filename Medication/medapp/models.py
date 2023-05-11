from django.db import models


# Create your models here.

class DoctorEducationModel(models.Model):
    dr_education_id = models.AutoField(primary_key=True)
    dr_degree = models.CharField(max_length=50, null=False)

    class Meta:
        # table name
        db_table = 'doctor_education'


class DoctorModel(models.Model):
    dr_id = models.AutoField(primary_key=True)
    dr_name = models.CharField(max_length=50, null=False)
    dr_education = models.ForeignKey(DoctorEducationModel, on_delete=models.CASCADE)
    dr_email = models.EmailField(max_length=50, unique=True, null=False)
    dr_mobile = models.CharField(max_length=14, unique=True, null=False)
    dr_password = models.CharField(max_length=500, null=False)
    dr_address = models.CharField(max_length=100, null=False)

    def __str__(self):
        return self.dr_name

    class Meta:
        # apply indexes
        indexes = [
            models.Index(fields=['dr_name', ]),
            models.Index(fields=['dr_education', ]),
        ]
        # table name
        db_table = 'doctor'


class PharmacyModel(models.Model):
    pharmacy_id = models.AutoField(primary_key=True)
    pharmacy_name = models.CharField(max_length=50, null=False)
    pharmacy_email = models.EmailField(max_length=50, unique=True, null=False)
    pharmacy_mobile = models.CharField(max_length=14, unique=True, null=False)
    pharmacy_password = models.CharField(max_length=500, null=False)
    pharmacy_address = models.CharField(max_length=100, null=False)

    def __str__(self):
        return self.pharmacy_name

    class Meta:
        # table name
        db_table = 'pharmacy'


class UserModel(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_name = models.CharField(max_length=50, null=False)
    user_email = models.EmailField(max_length=50, unique=True, null=False)
    user_mobile = models.CharField(max_length=14, unique=True, null=False)
    user_password = models.CharField(max_length=500, null=False)
    user_address = models.CharField(max_length=100, null=False)

    def __str__(self):
        return self.user_name

    class Meta:
        # table name
        db_table = 'user'


class PrescriptionModel(models.Model):
    prescription_id = models.AutoField(primary_key=True)
    patient_name = models.CharField(max_length=50)
    patient_email = models.EmailField(max_length=50)
    patient_prescription = models.TextField(null=False)
    dr_id = models.ForeignKey(DoctorModel, on_delete=models.CASCADE)
    user_id = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    prescription_datetime = models.DateTimeField(auto_now_add=True, blank=False, null=False)
    class Meta:
        # table name
        db_table = 'prescription'


class AppointmentModel(models.Model):
    id = models.AutoField(primary_key=True)
    user_id = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    dr_id = models.ForeignKey(DoctorModel, on_delete=models.CASCADE)
    appointment_datetime = models.DateTimeField()
    status = models.IntegerField(default=0, help_text="0-not accepted, 1-accepted, 2-rejected")

    class Meta:
        # table name
        db_table = 'appointment'


class PrescriptionModel1(models.Model):
    prescription_id = models.AutoField(primary_key=True)
    patient_name = models.CharField(max_length=50)
    patient_email = models.EmailField(max_length=50)
    patient_prescription = models.TextField(null=False)
    dr_id = models.ForeignKey(DoctorModel, on_delete=models.CASCADE)
    user_id = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    prescription_datetime = models.DateTimeField(auto_now_add=True, blank=False, null=False)

    class Meta:
        # table name
        db_table = 'prescription1'


class PrescriptionModel2(models.Model):
    prescription_id = models.AutoField(primary_key=True)
    patient_name = models.CharField(max_length=50)
    patient_email = models.EmailField(max_length=50)
    patient_prescription = models.TextField(null=False)
    dr_id = models.ForeignKey(DoctorModel, on_delete=models.CASCADE)
    user_id = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    prescription_datetime = models.DateTimeField(auto_now_add=True, blank=False, null=False)

    class Meta:
        # table name
        db_table = 'prescription2'


class PrescriptionModel3(models.Model):
    prescription_id = models.AutoField(primary_key=True)
    patient_name = models.CharField(max_length=50)
    patient_email = models.EmailField(max_length=50)
    patient_prescription = models.TextField(null=False)
    dr_id = models.ForeignKey(DoctorModel, on_delete=models.CASCADE)
    user_id = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    prescription_datetime = models.DateTimeField(auto_now_add=True, blank=False, null=False)

    class Meta:
        # table name
        db_table = 'prescription3'


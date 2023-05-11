from django.shortcuts import render, redirect
from medapp.models import DoctorModel, PharmacyModel, PrescriptionModel, AppointmentModel, UserModel, \
    DoctorEducationModel,PrescriptionModel1,PrescriptionModel2,PrescriptionModel3
from django.contrib import messages
from django.db.models import Q
from medapp.email import prescription_mail
from datetime import datetime
from django.views.generic.base import View
from cryptography.fernet import Fernet
from django.contrib.auth.hashers import check_password, make_password
from medapp.decorators import doctor_login_required, pharmacy_login_required, user_login_required
key = b'xf_UfcpjMj2l3drwdrBFtisdh79pu-i04DyY_-I3C4A='


def home(request):
    return render(request,'home.html')


def doctor_login(request):
    if request.method == "POST":
        try:
            email = request.POST['email']
            password = request.POST['password']
            drqs = DoctorModel.objects.get(dr_email=email, dr_password=password)
            if drqs:
                request.session['doctor_id'] = drqs.dr_id
                request.session['doctor_name'] = drqs.dr_name
                return redirect("dr_view_appointments")
        except Exception as ex:
            messages.error(request, "Invalid Email or Password")
            print(str(ex))
    return render(request, "doctor-login.html")


def doctor_signup(request):
    if request.method == 'POST':
        name = request.POST['docname']
        degree = request.POST['docdegree']
        email = request.POST['docemail']
        mobile = request.POST['docmobile']
        password = request.POST['password']
        address = request.POST['docaddress']
        demobj = DoctorEducationModel.objects.get(dr_education_id=degree)
        DoctorModel(dr_name=name, dr_education=demobj, dr_email=email, dr_mobile=mobile, dr_password=password,
                    dr_address=address).save()
        messages.success(request, "Registration Done Successfully")
        return redirect('doctor_login')
    edu = DoctorEducationModel.objects.all()
    return render(request, "doctor-registration.html", {"edu": edu})


def doctor_logout(request):
    try:
        # Flush session data
        del request.session['doctor_id']
        del request.session['doctor_name']
        request.session.flush()
    except Exception as ex:
        print("Doctor Logout Error : ", ex)
    return redirect("doctor_login")


@doctor_login_required
def dr_view_appointments(request):
    dr_id = request.session['doctor_id']
    qs = AppointmentModel.objects.filter(~Q(status=2), dr_id=dr_id)
    return render(request, "view-appointment.html", {"appointments": qs})


@doctor_login_required
def send_prescription(request):
    dr_id = request.session['doctor_id']
    if request.method == "POST":
        try:
            pemail = request.POST['patientemail']
            user_obj = UserModel.objects.get(user_email=pemail)
            dr_obj = DoctorModel.objects.get(dr_id=dr_id)
            pname = request.POST['patientname']
            prescription = request.POST['prescription']

            # key = Fernet.generate_key()
            #key = b'xf_UfcpjMj2l3drwdrBFtisdh79pu-i04DyY_-I3C4A='
            fernet = Fernet(key)
            encPrescription = fernet.encrypt(prescription.encode())
            print(encPrescription)
            pres_obj = PrescriptionModel(patient_name=pname, patient_email=pemail, patient_prescription=encPrescription,
                                         dr_id=dr_obj, user_id=user_obj)
            pres_obj1 = PrescriptionModel1(patient_name=pname, patient_email=pemail, patient_prescription=encPrescription,
                                           dr_id=dr_obj, user_id=user_obj)
            pres_obj2 = PrescriptionModel2(patient_name=pname, patient_email=pemail, patient_prescription=encPrescription,
                                           dr_id=dr_obj, user_id=user_obj)
            pres_obj3 = PrescriptionModel3(patient_name=pname, patient_email=pemail, patient_prescription=encPrescription,
                                           dr_id=dr_obj, user_id=user_obj)
            pres_obj.save()
            pres_obj1.save()
            pres_obj2.save()
            pres_obj3.save()
            print(pres_obj)
            status = prescription_mail(pname, pres_obj.prescription_id, dr_obj.dr_name, pemail)

            if status == 1:
                messages.success(request, 'email sent successfully')
            else:
                messages.error(request, 'failed to send email. please try again')
        except Exception as ex:
            messages.error(request, str(ex))

    return render(request, "send-prescription.html", {"dr_id": dr_id, })


@doctor_login_required
def DoctorAccept(request):
    apmtid = request.GET.get("apmtid")
    print(apmtid)
    qs = AppointmentModel.objects.filter(id=apmtid).update(status=1)
    print(qs)
    return redirect("dr_view_appointments")



@doctor_login_required
def DoctorReject(request):
    apmtid = request.GET.get("apmtid")
    print(apmtid)
    qs = AppointmentModel.objects.filter(id=apmtid).update(status=2)
    print(qs)
    return redirect("dr_view_appointments")


def user_login(request):
    if request.method == "POST":
        try:
            email = request.POST['email']
            password = request.POST['password']
            uqs = UserModel.objects.get(user_email=email, user_password=password)
            if uqs:
                request.session['user_id'] = uqs.user_id
                request.session['user_name'] = uqs.user_name
                return redirect("book_appointment")
        except Exception as ex:
            messages.error(request, "Invalid Email or Password")
            print(str(ex))
    return render(request, "user-login.html")


def user_signup(request):
    if request.method == 'POST':
        name = request.POST['username']
        email = request.POST['useremail']
        mobile = request.POST['usermobile']
        password = request.POST['password']
        address = request.POST['useraddress']
        UserModel(user_name=name, user_email=email, user_mobile=mobile, user_password=password,
                  user_address=address).save()
        messages.success(request, "Registration Done Successfully")
        return redirect('user_login')
    return render(request, "user-registration.html")


@user_login_required
def book_appointment(request):
    uid = request.session['user_id']
    drqs = DoctorModel.objects.all()
    if request.method == "POST":
        dt = request.POST['date']
        tm = request.POST['time']
        dr = request.POST['doctor']
        uobj = UserModel.objects.get(user_id=uid)
        drobj = DoctorModel.objects.get(dr_id=dr)
        qs = AppointmentModel(user_id=uobj, dr_id=drobj,
                              appointment_datetime=datetime.strptime(dt + ' ' + tm, '%Y-%m-%d %H:%M'))
        qs.save()
        messages.success(request, "Appointment booked successfully")
    return render(request, 'book-appointment.html', {"doctors": drqs})


@user_login_required
def user_view_appointment(request):
    uid = request.session['user_id']
    userappointments = AppointmentModel.objects.filter(~Q(status=2), user_id=uid)
    print(userappointments)
    for i in userappointments:
        print(i.dr_id.dr_name, i.appointment_datetime, i.status)
    return render(request, "user-view-appointment.html", {"data": userappointments})


def user_logout(request):
    try:
        # Flush session data
        del request.session['user_id']
        del request.session['user_name']
        request.session.flush()
    except Exception as ex:
        print("User Logout Error : ", ex)
    return redirect("user_login")


def pharmacy_login(request):
    if request.method == "POST":
        try:
            email = request.POST['email']
            password = request.POST['password']
            pqs = PharmacyModel.objects.get(pharmacy_email=email, pharmacy_password=password)
            if pqs:
                request.session['pharmacy_id'] = pqs.pharmacy_id
                request.session['pharmacy_name'] = pqs.pharmacy_name
                print(request.session['pharmacy_id'])
                return redirect("decrypt_prescription")
        except Exception as ex:
            messages.error(request, "Invalid Email or Password")
            print(str(ex))
    return render(request, "pharmacy-login.html")


def pharmacy_signup(request):
    if request.method == 'POST':
        name = request.POST['pharmacyname']
        email = request.POST['pharmacyemail']
        mobile = request.POST['pharmacymobile']
        password = request.POST['password']
        address = request.POST['pharmacyaddress']
        PharmacyModel(pharmacy_name=name, pharmacy_email=email, pharmacy_mobile=mobile, pharmacy_password=password,
                      pharmacy_address=address).save()
        messages.success(request, "Registration Done Successfully")
        return redirect('pharmacy_login')
    return render(request, "pharmacy-registration.html")


def pharmacy_logout(request):
    try:
        # Flush session data
        del request.session['pharmacy_id']
        del request.session['pharmacy_name']
        request.session.flush()
    except Exception as ex:
        print("Pharmacy Logout Error : ", ex)
    return redirect("pharmacy_login")


# class DecryptPrescription(View):
#     @pharmacy_login_required
#     def get(self,request):
#         return render(request,"decrypt-prescription.html")
#
#     @pharmacy_login_required
#     def post(self,request):
#         try:
#             num=request.POST.get("number")
#             email=request.POST.get("useremail")
#             qs=PrescriptionModel.objects.get(prescription_id=num,patient_email=email)
#             encPrescription=qs.patient_prescription
#             # key = Fernet.generate_key()
#             key = "AjiT"
#             fernet = Fernet(key)
#             decPrescription = fernet.decrypt(encPrescription).decode()
#             return render(request,"decrypt-prescription.html",{"prescription":decPrescription})
#         except Exception as ex:
#             messages.error(request,"Invalid prescription number or email address")
#             print(ex)
#         return redirect("decrypt_prescription")


def decrypt(to_decrypt):
    fernet = Fernet(key)
    enc_amt_db = to_decrypt
    enc_amt_str = enc_amt_db.strip('b').strip("'")
    enc_amt_byt = bytes(enc_amt_str, 'utf-8')
    decryped_amt = fernet.decrypt(enc_amt_byt).decode('ascii')
    return decryped_amt


@pharmacy_login_required
def decrypt_prescription(request):
    if request.method == "POST":
        try:
            num = request.POST.get("number")
            email = request.POST.get("useremail")
            qs = PrescriptionModel.objects.get(prescription_id=num, patient_email=email)
            qs1 = PrescriptionModel1.objects.get(prescription_id=num, patient_email=email)
            qs2 = PrescriptionModel2.objects.get(prescription_id=num, patient_email=email)
            qs3 = PrescriptionModel3.objects.get(prescription_id=num, patient_email=email)
            msg = "Transaction message"
            encPrescription = qs.patient_prescription
            encPrescription1 = qs1.patient_prescription
            encPrescription2 = qs2.patient_prescription
            encPrescription3 = qs3.patient_prescription
            f_encPrescription = 0
            if encPrescription == encPrescription1:
                if encPrescription1 == encPrescription2:
                    if encPrescription2 == encPrescription3:
                        msg = "Data is same in all tables"
                        f_encPrescription = encPrescription
                    else:
                        msg = "4th table tempered and showing data from other same tables"
                        f_encPrescription = encPrescription
                elif encPrescription1 == encPrescription3:
                    msg = "3rd table tempered and showing data from other same tables"
                    f_encPrescription = encPrescription
                elif encPrescription2 == encPrescription3:
                    msg = "2nd tables tempered and showing data from other same tables"
                    f_encPrescription = encPrescription
            elif encPrescription == encPrescription2:
                if encPrescription1 == encPrescription3:
                    msg = " 3rd table tempered and showing data from other same tables"
                    f_encPrescription = encPrescription
                elif encPrescription2 == encPrescription3:
                    msg = " 2nd table tempered and showing data from other same tables"
                    f_encPrescription = encPrescription
            elif encPrescription1 == encPrescription2:
                if encPrescription1 == encPrescription3:
                    msg = "1st table tempered and showing data other than 1st table"
            else:
                f_encPrescription = "THE DATA IS TEMPERED"

            # key = Fernet.generate_key()
            #key = b'xf_UfcpjMj2l3drwdrBFtisdh79pu-i04DyY_-I3C4A='
            print(key, type(key), encPrescription.encode('ascii'), type(f_encPrescription))

            #fernet = Fernet(key)
            decPrescription = decrypt(f_encPrescription)
            return render(request, "decrypt-prescription.html", {"prescription": decPrescription, 'msg': msg})
        except Exception as ex:
            messages.error(request, "Invalid prescription number or email address")
            print(ex)
        #     num=request.POST.get("number")
        #     email=request.POST.get("useremail")
        #     qs=PrescriptionModel.objects.get(prescription_id=num,patient_email=email)
        #     encPrescription=qs.patient_prescription
        #     # key = Fernet.generate_key()
        #     key = b'xf_UfcpjMj2l3drwdrBFtisdh79pu-i04DyY_-I3C4A='
        #     print(key,type(key),bytes(encPrescription,'utf-8'),type(encPrescription))
        #     fernet = Fernet(key)
        #     decPrescription = fernet.decrypt(encPrescription).decode()
        #     return render(request,"decrypt-prescription.html",{"prescription":decPrescription})
    return render(request, "decrypt-prescription.html")


from django.http import HttpResponseRedirect
from django.urls import reverse


def user_login_required(view_func, login_url=None):
    def wrap(request, *args, **kwargs):
        if 'user_id' in request.session and 'user_name' in request.session:
            return view_func(request, *args, **kwargs)
        else:
            if login_url:
                return HttpResponseRedirect(login_url)
            return HttpResponseRedirect(reverse('user_logout'))
    return wrap


def doctor_login_required(view_func, login_url=None):
    def wrap(request, *args, **kwargs):
        if 'doctor_id' in request.session and 'doctor_name' in request.session:
            return view_func(request, *args, **kwargs)
        else:
            if login_url:
                return HttpResponseRedirect(login_url)
            return HttpResponseRedirect(reverse('doctor_logout'))
    return wrap


def pharmacy_login_required(view_func, login_url=None):
    def wrap(request, *args, **kwargs):
        if 'pharmacy_id' in request.session:
            return view_func(request, *args, **kwargs)
        else:
            if login_url:
                return HttpResponseRedirect(login_url)
            return HttpResponseRedirect(reverse('pharmacy_logout'))
    return wrap
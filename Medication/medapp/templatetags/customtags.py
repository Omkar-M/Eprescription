from django import template

register = template.Library()

def appointment_status(value):
    res="Pending"
    if value==0:
        res = "Pending"
    elif value==1:
        res = "Accepted"
    else:
        res = "Rejected"
    return res

register.filter('appointment_status', appointment_status)
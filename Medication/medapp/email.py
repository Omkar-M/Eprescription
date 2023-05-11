from django.core.mail import EmailMessage
from django.template.loader import render_to_string
from Medication import settings
FROM_EMAIL = settings.EMAIL_HOST_USER


def prescription_mail(name, no, dr, to):
    subject, from_email, to_emails = 'Prescription Number', FROM_EMAIL, [to]
    html_content = render_to_string('../templates/email/prescription.html', {'name': name, 'no':no, 'dr':dr})
    msg = EmailMessage(subject=subject, body=html_content, from_email=from_email, to=to_emails)
    msg.content_subtype = "html"  # Main content is now text/html
    return msg.send()
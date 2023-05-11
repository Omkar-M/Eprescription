# Generated by Django 4.0.4 on 2022-05-02 08:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('medapp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='PrescriptionModel3',
            fields=[
                ('prescription_id', models.AutoField(primary_key=True, serialize=False)),
                ('patient_name', models.CharField(max_length=50)),
                ('patient_email', models.EmailField(max_length=50)),
                ('patient_prescription', models.TextField()),
                ('prescription_datetime', models.DateTimeField(auto_now_add=True)),
                ('dr_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='medapp.doctormodel')),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='medapp.usermodel')),
            ],
            options={
                'db_table': 'prescription3',
            },
        ),
        migrations.CreateModel(
            name='PrescriptionModel2',
            fields=[
                ('prescription_id', models.AutoField(primary_key=True, serialize=False)),
                ('patient_name', models.CharField(max_length=50)),
                ('patient_email', models.EmailField(max_length=50)),
                ('patient_prescription', models.TextField()),
                ('prescription_datetime', models.DateTimeField(auto_now_add=True)),
                ('dr_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='medapp.doctormodel')),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='medapp.usermodel')),
            ],
            options={
                'db_table': 'prescription2',
            },
        ),
        migrations.CreateModel(
            name='PrescriptionModel1',
            fields=[
                ('prescription_id', models.AutoField(primary_key=True, serialize=False)),
                ('patient_name', models.CharField(max_length=50)),
                ('patient_email', models.EmailField(max_length=50)),
                ('patient_prescription', models.TextField()),
                ('prescription_datetime', models.DateTimeField(auto_now_add=True)),
                ('dr_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='medapp.doctormodel')),
                ('user_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='medapp.usermodel')),
            ],
            options={
                'db_table': 'prescription1',
            },
        ),
    ]

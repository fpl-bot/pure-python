# Generated by Django 2.1.3 on 2018-12-12 20:32

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('assets', '0004_auto_20181212_2007'),
    ]

    operations = [
        migrations.AlterField(
            model_name='measurepoint',
            name='sensor',
            field=models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='assets.Sensor'),
        ),
    ]
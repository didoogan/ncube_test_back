# Generated by Django 2.0.4 on 2018-04-07 19:02

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_auto_20180407_1848'),
    ]

    operations = [
        migrations.AddField(
            model_name='profile',
            name='role',
            field=models.ForeignKey(blank=True, default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.Role'),
        ),
    ]

from django.db import models

from ncube_test_back.users.models import User


class Role(models.Model):
    name = models.CharField(max_length=32)

    def __str__(self):
        return self.name


class Profile(models.Model):
    user = models.OneToOneField(User, related_name="profile",
                                on_delete=models.CASCADE, null=True,
                                blank=True)
    role = models.ForeignKey(Role, on_delete=models.SET_NULL, null=True,
                             blank=True, default=None)
    name = models.CharField(max_length=128, blank=True, default="")
    address = models.CharField(max_length=256, blank=True, default="")
    phone = models.CharField(max_length=15, blank=True, default="")
    cell_phone = models.CharField(max_length=15, blank=True, default="")
    # gender can be not determined, so NullBooleanField will be used
    gender = models.NullBooleanField(default=None)
    birth_day = models.DateField(null=True, blank=True)
    medical_information = models.CharField(blank=True, default="",
                                           max_length=512)
    medical_condition = models.CharField(blank=True, default="",
                                         max_length=512)
    # When patient receives an invitation, below field should be changed to
    # True
    invited = models.BooleanField(default=False)

    def __str__(self):
        return '<Profile> {}'.format(self.name)

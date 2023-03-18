from django.contrib.auth.models import (AbstractUser, )
from django.db import models
from authentication import data as auth_data


class User(AbstractUser):
    STATUS_CHOICES = (
        ("A", "Active"),
        ("I", "Inactive")
    )
    created_by = models.ForeignKey("self", on_delete=models.CASCADE, null=True, blank=True)
    role = models.CharField(max_length=5, choices=auth_data.User.ROLE_CHOICES, default='NU')
    status = models.CharField(max_length=5, choices=STATUS_CHOICES, default="A")

    def __str__(self):
        return f'{self.get_full_name()} : {self.email}'


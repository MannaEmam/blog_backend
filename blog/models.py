from django.contrib.auth.models import (AbstractUser, )
from django.db import models
from authentication import data as auth_data
from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token


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


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)

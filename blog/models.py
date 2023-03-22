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
    role = models.CharField(max_length=5, choices=auth_data.User.ROLE_CHOICES, default=auth_data.User.USER_ROLE)
    status = models.CharField(max_length=5, choices=STATUS_CHOICES, default="A")

    def __str__(self):
        return f'{self.username}'


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)


class Post(models.Model):
    author = models.ForeignKey(User, related_name='posts', on_delete=models.CASCADE)
    updated_by = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    title = models.CharField(max_length=200)
    article = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    view_count = models.BigIntegerField(default=0)

    def __str__(self):
        return self.title


class Comment(models.Model):
    created_by = models.ForeignKey(User, related_name='commenter', on_delete=models.CASCADE)
    post = models.ForeignKey(Post, related_name='comments', on_delete=models.CASCADE)
    body = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.body

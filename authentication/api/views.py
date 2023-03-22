from rest_framework import generics
from authentication.api import serializers as auth_serializers
from blog.models import User
from rest_framework.permissions import AllowAny
from authentication.permissions.permission import IsAdmin
from rest_framework.authentication import TokenAuthentication


class RegisterUser(generics.CreateAPIView):
    permission_classes = [AllowAny, ]
    queryset = User.objects.all()
    serializer_class = auth_serializers.UserSerializer


class UserDetail(generics.RetrieveUpdateDestroyAPIView):
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAdmin, ]
    queryset = User.objects.all()
    serializer_class = auth_serializers.UserSerializer

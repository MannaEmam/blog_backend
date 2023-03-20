from rest_framework import generics
from authentication.api import serializers as auth_serializers
from blog.models import User
from rest_framework.permissions import AllowAny, IsAuthenticated


class RegisterUser(generics.CreateAPIView):
    permission_classes = [AllowAny, ]
    queryset = User.objects.all()
    serializer_class = auth_serializers.UserSerializer


class UserDetail(generics.RetrieveAPIView):
    permission_classes = [IsAuthenticated, ]
    queryset = User.objects.all()
    serializer_class = auth_serializers.UserSerializer



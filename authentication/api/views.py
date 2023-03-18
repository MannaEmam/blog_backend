from rest_framework import status
from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from authentication.api import serializers as auth_serializers
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.models import Token
from blog.models import User
from authentication.permissions.permission import IsOwner


@api_view(["POST", ])
@authentication_classes([])
@permission_classes([AllowAny, ])
def register(request):
    serializer = auth_serializers.UserSerializer(data=request.data)
    if not serializer.is_valid():
        return Response(status=status.HTTP_400_BAD_REQUEST, data=serializer.errors)
    serializer.save()
    data = {"message": "Your account has been created now do login."}
    return Response(status=status.HTTP_201_CREATED, data=data)


@api_view(["GET", "PATCH"])
@authentication_classes([TokenAuthentication])
@permission_classes([IsOwner, ])
def get_user(request):
    if request.method == "GET":
        # user_id = Token.objects.get(key=request.auth.key).user_id
        # user = User.objects.get(id=user_id)
        serializer = auth_serializers.UserSerializer(request.user)
        return Response(status=status.HTTP_200_OK, data=serializer.data)
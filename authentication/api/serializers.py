from rest_framework import serializers
from django.contrib.auth import get_user_model
from authentication.data import User as user_data
User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    posts = serializers.StringRelatedField(many=True, read_only=True)

    def create(self, validated_data):

        user = User.objects.create_user(
            username=validated_data['username'],
            password=validated_data['password'],
        )
        return user

    def validate(self, data):
        """Ensuring that user role is admin or

        user is superuser if user is not any of them
        then he can not change the role field value.
        """

        try:
            request_user = self.context["request"].user
            if request_user.role != user_data.ADMIN_ROLE and not request_user.is_superuser:
                data.pop('role', self.instance.role)
        except:
            pass
        return data

    class Meta:
        model = User
        fields = (
            'id', 'username', 'password',
            'first_name', 'last_name', 'email', 'role', 'posts',
        )

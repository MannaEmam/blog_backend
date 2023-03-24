from rest_framework import serializers
from django.contrib.auth import get_user_model
from authentication.data import User as user_data
from blog.api import PostSerializer

User = get_user_model()


class UserSerializer(serializers.ModelSerializer):
    """Add fields if query param value exists."""
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        posts = PostSerializer(read_only=True, many=True)
        fields = dict()
        fields['posts'] = posts

        extra_data = self.context['request'].query_params.getlist('extra_data')
        if extra_data is not None:
            for data in extra_data:
                if data in fields:
                    self.fields.update({data: fields[data]})

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

    password = serializers.CharField(write_only=True)

    class Meta:
        model = User
        fields = (
            'id', 'username', 'password',
            'first_name', 'last_name', 'email', 'role',
        )

from rest_framework import serializers
from django.contrib.auth import get_user_model
User = get_user_model()


class UserSerializer(serializers.HyperlinkedModelSerializer):

    password = serializers.CharField(write_only=True)
    posts = serializers.HyperlinkedRelatedField(many=True, view_name='post-detail', read_only=True)

    def create(self, validated_data):

        user = User.objects.create_user(
            username=validated_data['username'],
            password=validated_data['password'],
        )
        return user

    class Meta:
        model = User
        fields = (
            'id', 'username', 'password',
            'first_name', 'last_name', 'email', 'role', 'posts',
        )



from rest_framework import serializers
from django.contrib.auth import get_user_model
from blog.models import Post
UserModel = get_user_model()


class UserSerializer(serializers.ModelSerializer):

    password = serializers.CharField(write_only=True)
    posts = serializers.HyperlinkedRelatedField(many=True, view_name='post-detail', read_only=True)
    print(posts)

    def create(self, validated_data):

        user = UserModel.objects.create_user(
            username=validated_data['username'],
            password=validated_data['password'],
        )
        return user

    class Meta:
        model = UserModel
        fields = (
            "id", "username", "password",
            "first_name", "last_name", "email", "role", "posts"
        )



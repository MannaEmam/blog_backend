from rest_framework import serializers
from blog.models import Post, Comment


class CommentSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')

    class Meta:
        model = Comment
        fields = ('id', 'post', 'body', 'owner', 'created')


class PostSerializer(serializers.ModelSerializer):
    owner = serializers.ReadOnlyField(source='owner.username')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        extra_data = self.context.get('extra_data', False)
        if extra_data == 'comments':
            comments = CommentSerializer(read_only=True, many=True)
            self.fields.update(({'comments': comments}))

    class Meta:
        model = Post
        fields = ('id', 'title', 'body', 'owner', 'created', 'updated')


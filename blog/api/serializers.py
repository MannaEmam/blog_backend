from rest_framework import serializers
from blog.models import Post, Comment


class CommentSerializer(serializers.ModelSerializer):

    created_by = serializers.ReadOnlyField(source='created_by.username')

    class Meta:
        model = Comment
        fields = ('id', 'post', 'created_by', 'body', 'created_at', 'updated_at')


class PostSerializer(serializers.ModelSerializer):

    author = serializers.ReadOnlyField(source='author.username')
    updated_by = serializers.ReadOnlyField(source='updated_by.username')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        extra_data = self.context.get('extra_data', False)
        if extra_data == 'comments':
            comments = CommentSerializer(read_only=True, many=True)
            self.fields.update(({'comments': comments}))

    class Meta:
        model = Post
        read_only_fields = ('view_count',)
        fields = ('id', 'title', 'article', 'author', 'created_at', 'updated_at', 'updated_by', 'view_count')


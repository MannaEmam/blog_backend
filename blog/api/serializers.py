from rest_framework import serializers
from blog.models import Post, Comment


class CommentSerializer(serializers.ModelSerializer):
    created_by = serializers.ReadOnlyField(source='created_by.username')

    class Meta:
        model = Comment
        fields = ('id', 'post', 'created_by', 'body', 'created_at', 'updated_at')


class PostSerializer(serializers.ModelSerializer):

    """Add fields if query param value exists."""
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        comments = CommentSerializer(read_only=True, many=True)
        fields = dict()
        fields['comments'] = comments

        try:
            extra_data = self.context['request'].query_params.getlist('extra_data')
            if extra_data is not None:
                for data in extra_data:
                    if data in fields:
                        self.fields.update({data: fields[data]})
        except:
            pass

    author = serializers.ReadOnlyField(source='author.username')
    updated_by = serializers.ReadOnlyField(source='updated_by.username')

    class Meta:
        model = Post
        read_only_fields = ('view_count',)
        fields = ('id', 'title', 'article', 'author', 'created_at', 
                  'updated_at', 'updated_by', 'view_count',
                  )

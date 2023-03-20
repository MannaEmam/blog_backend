from blog.models import Post, Comment
from .serializers import PostSerializer, CommentSerializer
from rest_framework.authentication import TokenAuthentication
from rest_framework import viewsets
from authentication.permissions.permission import IsAdminOwnerModeratorOrReadOnly, IsPostOwnerCommentOwnerAdminOrReadOnly


class Post(viewsets.ModelViewSet):
    permission_classes = [IsAdminOwnerModeratorOrReadOnly, ]
    authentication_classes = [TokenAuthentication, ]
    queryset = Post.objects.all()
    serializer_class = PostSerializer

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class Comment(viewsets.ModelViewSet):
    permission_classes = [IsPostOwnerCommentOwnerAdminOrReadOnly, ]
    authentication_classes = [TokenAuthentication, ]
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)

from blog.models import Post, Comment
from .serializers import PostSerializer, CommentSerializer
from rest_framework.authentication import TokenAuthentication
from rest_framework import viewsets
from django_filters.rest_framework import DjangoFilterBackend
from authentication.permissions.permission import IsAdminOwnModOrRead, IsAdminOwnOrRead


class Post(viewsets.ModelViewSet):
    permission_classes = [IsAdminOwnModOrRead, ]
    authentication_classes = [TokenAuthentication, ]
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = ['body', 'title', 'owner', "created"]

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)


class Comment(viewsets.ModelViewSet):
    permission_classes = [IsAdminOwnOrRead, ]
    authentication_classes = [TokenAuthentication, ]
    queryset = Comment.objects.all()
    serializer_class = CommentSerializer

    def perform_create(self, serializer):
        serializer.save(owner=self.request.user)

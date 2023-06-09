from blog.models import Post, Comment
from blog.api import PostSerializer, CommentSerializer
from rest_framework.authentication import TokenAuthentication
from rest_framework import viewsets
from authentication.permissions.permission import IsAdminOwnModOrRead, IsAdminOwnOrRead
from django_filters.rest_framework import DjangoFilterBackend
from blog.utils import PostSearchFilter, PostFilterSet
from rest_framework.decorators import action
from rest_framework.response import Response


class Post(viewsets.ModelViewSet):
    permission_classes = [IsAdminOwnModOrRead, ]
    authentication_classes = [TokenAuthentication, ]
    queryset = Post.objects.all().order_by('created_at')
    serializer_class = PostSerializer
    filter_backends = [DjangoFilterBackend, PostSearchFilter]
    filterset_class = PostFilterSet
    search_fields = ['author__username']

    def perform_create(self, serializer):
        serializer.save(author=self.request.user)

    def perform_update(self, serializer):
        serializer.save(updated_by=self.request.user)

    """To count the view of post."""
    def retrieve(self, request, *args, **kwargs):
        post = self.get_object()
        post.view_count = post.view_count + 1
        post.save(update_fields=("view_count",))
        return super().retrieve(request, *args, **kwargs)

    """Returns top five viewed post as trending post,
        
        url_path allows to override the default path
        name 'function' name to custom name.
    
    """
    @action(detail=False, methods=['GET'], url_path='trending-post')
    def trending_post(self, request):
        queryset = self.queryset.order_by('-view_count')[:5]
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)


class Comment(viewsets.ModelViewSet):
    permission_classes = [IsAdminOwnOrRead, ]
    authentication_classes = [TokenAuthentication, ]
    queryset = Comment.objects.all().order_by('created_at')
    serializer_class = CommentSerializer

    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)

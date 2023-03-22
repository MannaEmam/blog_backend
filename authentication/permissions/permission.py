from rest_framework import permissions
from authentication.data.user import User
from rest_framework import serializers
from blog.models import Post


class IsAdminOwnModOrRead(permissions.BasePermission):

    def has_permission(self, request, view):

        if request.user.is_authenticated:
            return True

        if request.method in permissions.SAFE_METHODS:
            return True

    def has_object_permission(self, request, view, obj):
        
        if request.user.is_superuser:
            return True

        if request.method in permissions.SAFE_METHODS:
            return True

        if request.user.role == User.ADMIN_ROLE:
            return True

        if obj.author == request.user:
            return True

        if request.user.role == User.MOD_ROLE and request.method != "DELETE":
            return True

        return False


class IsAdminOwnOrRead(permissions.BasePermission):
    no_acc = ["PUT", "PATCH"]

    def has_permission(self, request, view):

        if request.user.is_authenticated:
            return True

    def has_object_permission(self, request, view, obj):

        if request.user.is_superuser and request.method not in self.no_acc:
            return True

        if request.user.role == User.ADMIN_ROLE and request.method not in self.no_acc:
            return True

        if request.method in permissions.SAFE_METHODS:
            return True

        if obj.created_by == request.user:
            return True

        try:
            post_id = request.query_params.get('post')
            post_author = Post.objects.get(id=post_id).author

        except:
            post_author = None

        if post_author == request.user and request.method == "DELETE":
            return True

        return False


class IsAdmin(permissions.BasePermission):

    def has_permission(self, request, view):

        if request.user.is_authenticated:
            return True

    def has_object_permission(self, request, view, obj):

        if request.user.is_superuser:
            return True

        if request.user.role == User.ADMIN_ROLE:
            return True

        return False

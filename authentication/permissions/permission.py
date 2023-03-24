from rest_framework import permissions
from authentication.data.user import User
from blog.models import Post


class IsAdminOwnModOrRead(permissions.BasePermission):

    """Anonymous user can see post list and post detail

        Admin and superuser has every access to any post.
        User has access to do everything with his post.
        Moderator has access like a user additional access
        to update others post.
    """

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
    """An authenticated user can create comment.

        Only comment owner can update his comment.
        Admin, superuser has access to delete any comment on any post.
        User can delete his comment along with comments in his post.
    """
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


class IsAdminOrUser(permissions.BasePermission):

    """Anybody is allowed to register as a user.

        Any authenticated user can see others user details.
        User can update his own data but can't delete.
        Admin and superuser has every access.
    """

    def has_permission(self, request, view):

        if request.user.is_authenticated:
            return True

    def has_object_permission(self, request, view, obj):

        if request.user.is_superuser:
            return True

        if request.user.role == User.ADMIN_ROLE:
            return True

        if request.user == obj and request.method != "DELETE":
            return True

        return False


class IsAdmin(permissions.BasePermission):

    """ Only Admin and superuser has access."""
    def has_permission(self, request, view):

        if request.user.is_authenticated:

            if request.user.role == User.ADMIN_ROLE:
                return True

            if request.user.is_superuser:
                return True



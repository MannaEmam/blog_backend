from rest_framework import permissions
from authentication.data.user import User


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

        if obj.owner == request.user:
            return True

        if request.user.role == User.MOD_ROLE and request.method != "DELETE":
            return True

        return False


class IsAdminOwnOrRead(permissions.BasePermission):

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

        if obj.owner == request.user:
            return True

        # if request.data.

        return False


class IsSuperUser(permissions.BasePermission):

    def has_permission(self, request, view):

        if request.user.is_authenticated:
            return True

    def has_object_permission(self, request, view, obj):
        if request.user.is_superuser:
            return True

        return False

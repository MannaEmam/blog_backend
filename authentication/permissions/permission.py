from rest_framework import permissions


class IsAdminOwnModOrRead(permissions.BasePermission):
    md_methods = ("GET", "PATCH")
    nu_methods = ("GET", "POST")

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

        if request.user.role == "OA":
            return True

        if obj.owner == request.user:
            return True

        if request.user.role == "MD" and request.method in self.md_methods:
            return True

        if request.user.role == "NU" and request.method in self.nu_methods:
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

        if request.user.role == "OA":
            return True

        if obj.owner == request.user:
            return True

        return False


class IsSuperUser(permissions.BasePermission):

    def has_permission(self, request, view):

        if request.user.is_authenticated:
            return True

    def has_object_permission(self, request, view, obj):
        if request.user.is_superuser:
            return True

        return False

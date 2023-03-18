from django.urls import path
import authentication.api.views as auth_views
from rest_framework.authtoken import views

urlpatterns = [
    path("register/", auth_views.register, name="register"),
    path("login/", views.obtain_auth_token, name='api-token-auth'),
    path("user-data/", auth_views.get_user, name="get-user"),
]

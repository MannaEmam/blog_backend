from django.urls import path, include
import authentication.api.views as auth_views
from rest_framework.authtoken import views


urlpatterns = [
    path("register/", auth_views.RegisterUser.as_view(), name="register"),
    path("login/", views.obtain_auth_token, name='api-token-auth'),
    path("user-data/<int:pk>/", auth_views.UserDetail.as_view(), name="get-user"),
]

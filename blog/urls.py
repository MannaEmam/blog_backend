from django.urls import path, include
from rest_framework.routers import DefaultRouter
from blog.api import views
router = DefaultRouter()
router.register(r'posts', views.Post, basename="post")
router.register(r'comments', views.Comment, basename="comment")

urlpatterns = [
    path('', include(router.urls)),
]
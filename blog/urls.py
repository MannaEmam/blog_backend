from django.urls import path, include
from rest_framework.routers import SimpleRouter
from blog.api import viewsets
from . import views
router = SimpleRouter()
router.register(r'posts', viewsets.Post, basename="post")
router.register(r'comments', viewsets.Comment, basename="comment")

urlpatterns = [
    path('', include(router.urls)),
    path('admin-dashboard/', views.admin_dashboard),
]

from django_filters import CharFilter
from rest_framework.filters import SearchFilter
from django_filters.rest_framework import FilterSet, DateFilter
from blog.models import Post


class PostSearchFilter(SearchFilter):
    search_param = 'author'


class PostFilterSet(FilterSet):
    body = CharFilter(
        field_name='article', lookup_expr='icontains'
    )
    created = DateFilter(
        field_name='created_at', lookup_expr='icontains'
    )
    title = CharFilter(
        field_name='title', lookup_expr='icontains'
    )

    class Meta:
        model = Post
        fields = []

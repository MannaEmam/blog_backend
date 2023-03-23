from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.response import Response
from rest_framework.reverse import reverse
from rest_framework.authentication import TokenAuthentication
from authentication.permissions.permission import IsAdmin


@api_view(['GET'])
@authentication_classes([TokenAuthentication])
@permission_classes([IsAdmin])
def admin_dashboard(request, format=None):
    return Response({
        'users': reverse('user-list', request=request, format=format),
        'post': reverse('post-list', request=request, format=format),
        'comment': reverse('comment-list', request=request, format=format)
    })

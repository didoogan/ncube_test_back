from rest_framework import viewsets

from api.api.serializers import UserSerializer
from ncube_test_back.users.models import User


class UserViewSet(viewsets.ModelViewSet):
    serializer_class = UserSerializer
    queryset = User.objects.all()

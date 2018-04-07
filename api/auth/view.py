from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated

from api.auth.serializers import UserSerializer, ProfileSerializer
from api.models import Profile
from ncube_test_back.users.models import User


class UserViewSet(viewsets.ModelViewSet):
    serializer_class = UserSerializer
    queryset = User.objects.all()
    permission_classes = (IsAuthenticated,)


class ProfileViewSet(viewsets.ModelViewSet):
    serializer_class = ProfileSerializer
    queryset = Profile.objects.all()
    permission_classes = (IsAuthenticated,)

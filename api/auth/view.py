from rest_framework import viewsets, status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from api.auth.serializers import UserSerializer, ProfileSerializer
from api.models import Profile, Role
from ncube_test_back.users.models import User


class UserAPIView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        serializer = UserSerializer(request.user)
        return Response(data=serializer.data, status=status.HTTP_200_OK)


class ProfileViewSet(viewsets.ModelViewSet):
    serializer_class = ProfileSerializer
    queryset = Profile.objects.all()
    permission_classes = (IsAuthenticated,)

    def get_queryset(self):
        queryset = super(ProfileViewSet, self).get_queryset()
        visible_role = Role.objects.get(name='patient')
        queryset = queryset.filter(role=visible_role)
        profile = self.request.user.profile
        if profile.role == visible_role:
            queryset = queryset.filter(user=profile.user)
        return queryset

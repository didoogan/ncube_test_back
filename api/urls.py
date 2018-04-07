from django.conf.urls import url, include
from rest_framework.routers import DefaultRouter

from api.auth.view import UserViewSet, ProfileViewSet
from api.mail.views import SendInvitationAPIView

urlpatterns = [
    url('send-invite/', SendInvitationAPIView.as_view(), name='send_invite'),
]

router = DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'profiles', ProfileViewSet)
urlpatterns += router.urls

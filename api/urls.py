from django.conf.urls import url, include
from rest_framework.routers import DefaultRouter

from api.auth.view import ProfileViewSet, UserAPIView
from api.mail.views import SendInvitationAPIView

urlpatterns = [
    url('send-invite/', SendInvitationAPIView.as_view(), name='send_invite'),
    url('user-info/', UserAPIView.as_view(), name='user_info'),
]

router = DefaultRouter()
router.register(r'profiles', ProfileViewSet)
urlpatterns += router.urls

import uuid

from django.core.mail import send_mail
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from api.mail.mail_tamplates import invitation_template
from api.models import Profile
from ncube_test_back.users.models import User


class SendInvitationAPIView(APIView):
    permission_classes = (IsAuthenticated,)

    def post(self, request):
        profile_id = request.data.get('profile')
        if not profile_id:
            return Response({'error': 'You should provide profile id'},
                            status=status.HTTP_400_BAD_REQUEST)
        profile = Profile.objects.get(id=profile_id)
        if profile.invited:
            return Response({'error': 'This user already received invitation'})
        password = uuid.uuid4().hex
        username = '{}_{}'.format(profile.name.split()[0].lower(),
                                  password[-7:])
        user = User.objects.create(username=username)
        user.set_password(password)
        user.name = profile.name
        user.save()
        sender = request.user.profile
        message_args = [profile.name, username, password,
                        sender.name]
        message = invitation_template.format(*message_args)
        send_mail(subject='Hello',
                  message=message,
                  from_email=sender.email,
                  recipient_list=[profile.email])
        profile.invited = True
        profile.user = user
        profile.save()
        return Response(data={'message': 'ok'}, status=status.HTTP_200_OK)

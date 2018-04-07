from rest_framework.routers import DefaultRouter

from api.auth.view import UserViewSet, ProfileViewSet

router = DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'profiles', ProfileViewSet)
urlpatterns = router.urls

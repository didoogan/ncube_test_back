from rest_framework.routers import DefaultRouter

from api.api.view import UserViewSet

router = DefaultRouter()
router.register(r'users', UserViewSet)
urlpatterns = router.urls
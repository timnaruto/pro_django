from django.contrib import admin
from django.urls import path
import logging

logger = logging.getLogger(__name__)
logger.debug('This is a test debug message')
logger.info('This is a test log message')


urlpatterns = [
    path('admin/', admin.site.urls),
]

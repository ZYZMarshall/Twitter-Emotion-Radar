from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^update/(?P<configurationId>\w{0,50})/$', views.update, name="update"),
]

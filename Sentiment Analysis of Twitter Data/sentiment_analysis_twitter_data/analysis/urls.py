from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.listing, name="analysis-listing"),
    url(r'^details/(?P<id>\w{0,50})/$', views.details, name="analysis-details"),
    url(r'^add$', views.add, name="add"),
    url(r'^delete/(?P<id>\w{0,50})/$', views.delete, name="delete"),
    url(r'^update/(?P<analysisId>\w{0,50})/$', views.update, name="update"),
]

from django.conf.urls import url
from . import views

urlpatterns = [
    #url(r'^$', views.index, name="signin"),
    url(r'^$', views.index, name="login"),
    url(r'^report$', views.user_listing, name="user_listing"),
    url(r'^dashboard$', views.dashboard, name="dashboard"),
    url(r'^report/(?P<userId>\w{0,50})/$', views.user_listing, name="user_listing"),
    url(r'^update/(?P<userId>\w{0,50})/$', views.update, name="update"),
    url(r'^add$', views.add, name="add"),
    url(r'^forgot$', views.forgot, name="forgot"),
    url(r'^logout$', views.logout, name="logout"),
    url(r'^changepassword$', views.changepassword, name="changepassword"),
    url(r'^delete/(?P<userId>\w{0,50})/$', views.delete, name="delete"),
]
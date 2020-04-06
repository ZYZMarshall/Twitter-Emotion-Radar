# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class user(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_level_id = models.CharField(max_length=255, default = '2')
    user_username = models.CharField(max_length=255, default = "", unique=True)
    user_password = models.CharField(max_length=20, default = "")
    user_first_name = models.CharField(max_length=255, default = "")
    user_last_name = models.CharField(max_length=255, default = "")
    user_email = models.EmailField(max_length=255, default = "")
    user_mobile = models.CharField(max_length=255, default = "")
    user_gender = models.CharField(max_length=10, default = "")
    user_dob = models.CharField(max_length=255, default = "")
    user_city = models.CharField(max_length=255, default = "")
    user_state = models.CharField(max_length=255, default = "")
    user_country = models.CharField(max_length=255, default = "")
    user_add1 = models.TextField(default = "")
    user_add2 = models.TextField(default = "")
    user_image = models.CharField(max_length=255, null = True)
    def __str__(self):
        return self.user_first_name

class state(models.Model):
    state_id = models.AutoField(primary_key=True)
    state_name = models.CharField(max_length=255, default = "")
    def __str__(self):
        return self.state_name

class role(models.Model):
    role_id = models.AutoField(primary_key=True)
    role_title = models.CharField(max_length=255, default = "")
    role_description = models.TextField(default = "")
    def __str__(self):
        return self.state_name

class city(models.Model):
    city_id = models.AutoField(primary_key=True)
    city_name = models.CharField(max_length=255, default = "")
    def __str__(self):
        return self.city_name

class country(models.Model):
    country_id = models.AutoField(primary_key=True)
    country_name = models.CharField(max_length=255, default = "")
    def __str__(self):
        return self.country_name

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
from django.contrib import messages
from django.db import connection


# Create your views here.

def getData(id):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM configuration WHERE configuration_id = " + id)
    dataList = dictfetchall(cursor)
    return dataList[0];

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]
    
def update(request, configurationId):
    context = {
        "fn": "update",
        "configurationDetails": getData(configurationId),
        "heading": 'Update Configuration',
    }
    if (request.method == "POST"):
        cursor = connection.cursor()
        cursor.execute("""
                   UPDATE configuration
                   SET configuration_consumer_key=%s, configuration_consumer_secret=%s, configuration_access_token=%s, configuration_access_token_secret=%s WHERE configuration_id = %s
                """, (
            request.POST['configuration_consumer_key'],
            request.POST['configuration_consumer_secret'],
            request.POST['configuration_access_token'],
            request.POST['configuration_access_token_secret'],
            configurationId
        ))
        context["configurationDetails"] =  getData(configurationId)
        messages.add_message(request, messages.INFO, "Configuration updated succesfully !!!")
        return render(request, 'configuration.html', context)
    else:
        return render(request, 'configuration.html', context)

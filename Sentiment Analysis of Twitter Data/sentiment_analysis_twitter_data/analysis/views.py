from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
from django.contrib import messages
from django.db import connection
from analysis.SentimentAnalysis import SentimentAnalysis



def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

def getAPIKey(id):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM configuration WHERE configuration_id = " + id)
    dataList = dictfetchall(cursor)
    print("getAPIKey:",dataList[0])
    return dataList[0]

keys = getAPIKey("1")
sentiments = SentimentAnalysis(keys)
# Create your views here.

def listing(request):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM analysis")
    analysislist = dictfetchall(cursor)
    
    context = {
        "analysislist": analysislist
    }

    # Message according medicines Role #
    context['heading'] = "Analysis  Details"
    return render(request, 'analysis-details.html', context)

def details(request, id):
    sentimentdetails = getSentiment(id)
    if (sentimentdetails['sentiment_positive'] == None):
        sentimentdetails['sentiment_positive'] = 0

    if (sentimentdetails['sentiment_weakly_positive'] == None):
        sentimentdetails['sentiment_weakly_positive'] = 0

    if (sentimentdetails['sentiment_strongly_positive'] == None):
        sentimentdetails['sentiment_strongly_positive'] = 0

    if (sentimentdetails['sentiment_neutral'] == None):
        sentimentdetails['sentiment_neutral'] = 0

    if (sentimentdetails['sentiment_negative'] == None):
        sentimentdetails['sentiment_negative'] = 0

    if (sentimentdetails['sentiment_weakly_negetive'] == None):
        sentimentdetails['sentiment_weakly_negetive'] = 0

    if (sentimentdetails['sentiment_strongly_negetive'] == None):
        sentimentdetails['sentiment_strongly_negetive'] = 0

    context = {
        "analysisdetail": getData(id),
        "sentimentdetails": sentimentdetails
    }

    # Message according medicines Role #
    context['heading'] = "Analysis  Details"
    return render(request, 'analysis-list.html', context)

def getData(id):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM analysis WHERE analysis_id = " + id)
    dataList = dictfetchall(cursor)
    print("getData",dataList[0])
    return dataList[0]

def getSentiment(id):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM sentiment WHERE sentiment_anlysis_id = " + id)
    dataList = dictfetchall(cursor)
    print("getSentiment",dataList[0])
    return dataList[0]

def update(request, analysisId):
    context = {
        "fn": "update",
        "analysisDetails": getData(analysisId),
        "heading": 'Update Analysis ',
    }
    if (request.method == "POST"):
        cursor = connection.cursor()
        cursor.execute("""
                   UPDATE analysis
                   SET analysis_student_id=%s, analysis_subject_id=%s, analysis_lecture_title=%s, analysis_date=%s, analysis_description=%s WHERE analysis_id = %s
                """, (
            request.POST['analysis_student_id'],
            request.POST['analysis_subject_id'],
            request.POST['analysis_lecture_title'],
            request.POST['analysis_date'],
            request.POST['analysis_description'],
            analysisId
        ))
        context["analysisDetails"] =  getData(analysisId)
        messages.add_message(request, messages.INFO, "Analysis  updated succesfully !!!")
        return redirect('analysis-listing')
    else:
        return render(request, 'analysis.html', context)


def add(request):
    context = {
        "fn": "add",
        "heading": 'Add Analysis '
    }
    if (request.method == "POST"):
        cursor = connection.cursor()
        cursor.execute("""
		   INSERT INTO analysis
		   SET analysis_topic=%s, analysis_total_tweets=%s, analysis_date=%s, analysis_description=%s
		""", (
            request.POST['analysis_topic'],
            request.POST['analysis_total_tweets'],
            request.POST['analysis_date'],
            request.POST['analysis_description']))
        
        # Perform analysis on the data #
        sentiments.performAnalysis(request.POST['analysis_topic'], int (request.POST['analysis_total_tweets']), cursor.lastrowid)

        return redirect('analysis-listing')
    return render(request, 'analysis.html', context)

def delete(request, id):
    cursor = connection.cursor()
    sql = 'DELETE FROM analysis WHERE analysis_id=' + id
    cursor.execute(sql)
    messages.add_message(request, messages.INFO, "Analysis  Deleted succesfully !!!")
    return redirect('analysis-listing')

def getDropDown(table, condtion):
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM " + table + " WHERE " + condtion)
    dropdownList = dictfetchall(cursor)
    print(dropdownList)
    return dropdownList
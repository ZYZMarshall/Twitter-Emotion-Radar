from django import template
from django.db import connection

register = template.Library()

@register.simple_tag
def check_result_status(id):
    return getData(id)


def getData(id):
    ### Get the Topic ####
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM topics, subject WHERE topics_subject_id = subject_id AND topics_id = " + str(id))
    dataList = dictfetchall(cursor)
    if(dataList[0]['topics_level_id'] == "1"):
        return 1;
    elif(dataList[0]['topics_level_id'] == "2"):
        ### Get the test status ####
        cursor = connection.cursor()
        cursor.execute("SELECT count(*) FROM quiz, topics, subject WHERE topics_subject_id = subject_id AND topics_level_id = '1' AND quiz_topic_id = topics_id AND quiz_result = 'Pass' AND subject_id = " + str(dataList[0]['subject_id']))
        result=cursor.fetchone()
        return result[0];
    elif(dataList[0]['topics_level_id'] == "3"):
        ### Get the test status ####
        cursor = connection.cursor()
        cursor.execute("SELECT count(*) FROM quiz, topics, subject WHERE topics_subject_id = subject_id AND topics_level_id = '2' AND quiz_topic_id = topics_id AND quiz_result = 'Pass' AND subject_id = " + str(dataList[0]['subject_id']))
        result=cursor.fetchone()
        return result[0];
    elif(dataList[0]['topics_level_id'] == "4"):
        ### Get the test status ####
        cursor = connection.cursor()
        cursor.execute("SELECT count(*) FROM quiz, topics, subject WHERE topics_subject_id = subject_id AND topics_level_id = '3' AND quiz_topic_id = topics_id AND quiz_result = 'Pass' AND subject_id = " + str(dataList[0]['subject_id']))
        result=cursor.fetchone()
        return result[0];
        

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]
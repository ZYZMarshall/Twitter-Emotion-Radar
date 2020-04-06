from django.db import connection

def getDropDown(table, id_col, value_col, selected, condtion):
    options = "<option value='0'>Please Select</option>";
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM " + table + " WHERE " + condtion)
    dropdownList = dictfetchall(cursor)
    for data in dropdownList:
        if(data[id_col] == int(selected)):
            options = options +"<option selected='selected' value="+str(data[id_col])+">"+str(data[value_col])+"</option>"
        else:
            options = options +"<option value="+str(data[id_col])+">"+str(data[value_col])+"</option>"
    return options;

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]
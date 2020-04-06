from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings

# Create your views here.
def index(request):
    return render(request,'index.html')
def about(request):
    return render(request,'about.html')
def contact(request):
    return render(request,'contact.html')	
	
def listing(request, employeeId):
    try:
        employeelist =  employee.objects.filter(Q(employee_level=employeeId))
    except Exception as e:
        return HttpResponse('Something went wrong. Error Message : '+ str(e))

    context = {
        "showmsg": True,
        "message": "User Updated Successfully",
        "employeelist": employeelist
    }	
	    # Message according Users Role #
    if(employeeId == "1"):
        context['heading'] = "User Report";
    return render(request,'employee-report.html',context)
	
from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.db.models import Q
from django.core.files.storage import FileSystemStorage
from .models import role, user, city, state, country
from django.contrib import messages
from django.db import connection
from sentiment_analysis_twitter_data.utils import getDropDown, dictfetchall


# Create your views here.
def index(request):
    if(request.session.get('authenticated', False) == True):
        return redirect('/users/report')

    context = {
        "message": "Please Log in",
        "error": False
    }
    if(request.method == "POST"):
        try:
            getUser = user.objects.get(user_username=request.POST['username'])
            context['msg'] = getUser
        except Exception as e:
            context['message'] = "Wrong username" + str(e)
            context['error'] = True
            return render(request,'login.html', context)
        if(getUser.user_password == request.POST['password']):
            request.session['authenticated'] = True
            request.session['user_id'] = getUser.user_id
            request.session['user_level_id'] = getUser.user_level_id
            request.session['user_first_name'] = getUser.user_first_name
            return redirect('dashboard')
        else:
            context['message'] = "Wrong Password"
            context['error'] = True
            return render(request,'login.html', context)
    else:
        return render(request,'login.html', context)

def user_listing(request, userId):
    if(request.session.get('authenticated', False) != True):
        return redirect('/')
    try:
        userlist =  user.objects.filter(Q(user_level_id=userId))
    except Exception as e:
        return HttpResponse('Something went wrong. Error Message : '+ str(e))

    context = {
        "showmsg": True,
        "message": "User Updated Successfully",
        "userlist": userlist
    }
    # Message according Users Role #
    if(userId == "1"):
        context['heading'] = "Admin Report";
    if(userId == "2"):
        context['heading'] = "Students Report";
    if(userId == "3"):
        context['heading'] = "Teacher Report";
    return render(request,'user-report.html',context)

def dashboard(request):
    return render(request,'dashboard.html')

def forgot(request):
    return render(request,'forgotpass.html')

def update(request, userId):
    userDetails = user.objects.get(user_id=userId)

    context = {
    "fn":"update",
    "citylist":city.objects.all(),
    "statelist":state.objects.all(),
    "rolelist":role.objects.all(),
    "countrylist":country.objects.all(),
    "userdetails":userDetails
    }
    currentUserDetails = user.objects.get(user_id = userId)
    context['sub_heading'] = "Update Details of "+currentUserDetails.user_first_name;
    # Message according Users Role #
    if(currentUserDetails.user_level_id == 1):
        context['heading'] = "Admin";
    if(currentUserDetails.user_level_id == 2):
        context['heading'] = "Students";
    if(currentUserDetails.user_level_id == 2):
        context['heading'] = "Teacher";

    if (request.method == "POST"):
        try:
            user_image = None
            user_image = currentUserDetails.user_image
            if(request.FILES and request.FILES['user_image']):
                userImage = request.FILES['user_image']
                fs = FileSystemStorage()
                filename = fs.save(userImage.name, userImage)
                user_image = fs.url(userImage)
            
            addUser = user(
            user_id = userId,
            user_first_name = request.POST['user_first_name'],
            user_last_name = request.POST['user_last_name'],
            user_username = request.POST['user_username'],
            user_email = request.POST['user_email'],
            user_password = request.POST['user_password'],
            user_mobile = request.POST['user_mobile'],
            user_gender = request.POST['user_gender'],
            user_dob = request.POST['user_dob'],
            user_add1 = request.POST['user_add1'],
            user_add2 = request.POST['user_add2'],
            user_city = request.POST['user_city'],
            user_country = request.POST['user_country'],
            user_level_id = request.POST['user_level_id'],
            user_state = request.POST['user_state'],
            user_image = user_image)
            
            addUser.save()
        except Exception as e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        if (request.session.get('user_level_id', None) == 1):    
            messages.add_message(request, messages.INFO, "User Updated Successfully !!!")
            return redirect('/users/report/'+request.POST['user_level_id'])
    
        context["userdetails"] = user.objects.get(user_id=userId)
        messages.add_message(request, messages.INFO, "Your Account Updated Successfully !!!")
        return render(request,'user.html', context)
    else:
        return render(request,'user.html', context)

def add(request):
    context = {
    "fn":"add",
    "citylist":city.objects.all(),
    "rolelist":role.objects.all(),
    "heading":'Users',
    "sub_heading": 'Users',
    "statelist":state.objects.all(),
    "countrylist":country.objects.all()
    }
    if (request.method == "POST"):
        try:
            user_image = None

            if(request.FILES and request.FILES['user_image']):
                userImage = request.FILES['user_image']
                fs = FileSystemStorage()
                filename = fs.save(userImage.name, userImage)
                user_image = fs.url(userImage)

            addUser = user(user_first_name = request.POST['user_first_name'],
            user_username = request.POST['user_username'],
            user_last_name = request.POST['user_last_name'],
            user_email = request.POST['user_email'],
            user_password = request.POST['user_password'],
            user_mobile = request.POST['user_mobile'],
            user_gender = request.POST['user_gender'],
            user_dob = request.POST['user_dob'],
            user_add1 = request.POST['user_add1'],
            user_city = request.POST['user_city'],
            user_country = request.POST['user_country'],
            user_level_id = request.POST['user_level_id'],
            user_state = request.POST['user_state'],
            user_image = user_image)
            addUser.save()
        except Exception as e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))

        return redirect('/users/report/'+request.POST['user_level_id'])

    else:
        return render(request,'user.html', context)

def logout(request):
    request.session['authenticated']= False
    request.session['user_id'] = False
    request.session['user_level_id']= False
    request.session['user_first_name']= False
    return redirect('/')

def changepassword(request):
    if (request.method == "POST"):
        try:
            addUser = user(
                user_id = request.session.get('user_id', None),
                user_password = request.POST['user_new_password']
            )
            addUser.save(update_fields=["user_password"])
        except Exception as e:
            return HttpResponse('Something went wrong. Error Message : '+ str(e))
        messages.add_message(request, messages.INFO, "Your Password has been changed successfully !!!")
        return render(request,'change-password.html')

    else:
        return render(request,'change-password.html')
    return render(request,'change-password.html')

def delete(request, userId):
    try:
        deleteUser = user.objects.get(user_id = userId)
        deleteUser.delete()
    except Exception as e:
        return HttpResponse('Something went wrong. Error Message : '+ str(e))
    messages.add_message(request, messages.INFO, "User Deleted Successfully !!!")
    return redirect('/users/report/1')
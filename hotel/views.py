from django.shortcuts import render
from django.http.response import JsonResponse
from hotel.models import User


# 打开首页
def index(request):
    return render(request,"index.html")


# 打开登录页面.
def openlogin(request):
    return render(request, "login.html")


# 退出登录.
def logout(request):
    # 退出登录，清除session
    del request.session['username']
    result = {"code": 1001, "msg": "退出成功！", "result": {}}
    return JsonResponse(result)


# 获取session信息.
def get_session(request):
    username = request.session.get("username", None)
    nickname = request.session.get("nickname", None)
    result = {"code": 0, "msg": "成功！", "data": {"username": username, "nickname": nickname, "role": 0}}
    return JsonResponse(result)


# 判断用户名和密码
def login(request):
    result = {"code": 0,"msg": "","result":{"code": 0,"msg": ""}}    #   1：表示密码正确，0：表示密码错误
    #   获取前端的数据（用户名和密码）
    username = request.POST.get("username")
    password = request.POST.get("password")
    # 根据用户名到数据库去查询
    ml = User.objects.filter(username=username).values()
    if ml:
        #   开始判断
        if username == ml[0]["username"]:    #   说明用户名是存在
            if password == ml[0]["password"]:   #   说明密码是正确的
                result["result"]["code"] = 1
                result["result"]["msg"] = "密码正确"
                # 登录成功后保存session
                request.session["username"] = username
                request.session["nickname"] = ml[0]["nickname"]
            else:  #   说明密码错误
                result["result"]["msg"] = "密码错误！"
        else:
            result["result"]["msg"] = "用户名不存在！"
    else:
        result["result"]["msg"] = "用户名不存在！"
    return JsonResponse(result)


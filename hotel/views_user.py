from datetime import datetime
from django.http import JsonResponse

from hotel.models import User as Mo

import json

# 用户管理


# 获取用户数据
def get_list(request):
    #   获取页面提交的数据
    page = int(request.GET.get("page"))
    limit = int(request.GET.get("limit"))
    username = request.GET.get("username")
    status = request.GET.get("status",0)
    if username:
        #   到数据库去查找数据
        values = Mo.objects.filter(username__contains=username,status=status)[(page-1)*limit:limit*page].values()
        datas = list(values)
        total =len(datas)
    else:
        #   到数据库去查找数据
        values = Mo.objects.filter(status=status)[(page-1)*limit:limit*page].values()
        datas = list(values)
        total =len(datas)
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}

    return JsonResponse(result)


# 保存用户信息
def add(request):
    # 0：成功，-1：不成功
    result = {"code": 0, "msg": "操作成功！！"}
    # 获取页面的数据
    username = request.POST.get("username")
    # 判断一下这个用户是否存在，如果存在，就不能添加
    u = Mo.objects.filter(username = username)
    if u:
        result["code"] = -1
        result["msg"] = "用户已经存在，不能添加！！"
    else:
        # 插到数据库里面
        m = Mo()
        m.username = username
        m.password = "123456"
        m.status = 0
        m.updatetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        m.createtime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        # 真正的保存
        m.save()
    return JsonResponse(result)


#   修改、编辑
def edit(request):
    result = {"code": 0, "msg": "修改成功！"}
    #   获取前端的数据
    id = request.POST.get("id")
    username = request.POST.get("username")
    updatetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    #   更新
    Mo.objects.filter(id=id).update(username=username,updatetime=updatetime)
    return JsonResponse(result)

#   删除
def delete(request):
    result = {"code": 0, "msg": "删除成功！"}
    #   获取前端的数据
    ids = request.POST.get("id")
    Mo.objects.filter(id=ids).delete()
    return JsonResponse(result)


#   批量删除
def batchdel(request):
    result = {"code": 0, "msg": "删除成功！"}
    #   获取前端的数据
    ids = request.POST.get("ids")
    #   转化成json数据
    ids_json = json.loads(ids)
    #   转换成列表
    ids_list = []
    for m in ids_json:
        ids_list.append(m["id"])
    #   删除
    Mo.objects.filter(id__in=ids_list).delete()
    return JsonResponse(result)


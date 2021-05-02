from datetime import datetime
from django.http import JsonResponse

from hotel.models import Room as Mo
from django.forms.models import model_to_dict


import json

# 房间管理


# 获取房间数据
def get_list(request):
    #   获取页面提交的数据
    page = int(request.GET.get("page"))
    limit = int(request.GET.get("limit"))
    no = request.GET.get("no")
    status = request.GET.get("status",0)
    if no:
        #   到数据库去查找数据
        values = Mo.objects.filter(no__contains=no,status=status)[(page-1)*limit:limit*page].values("id",'status',"floorno","floorid","room",'room_type_id','room_type_id__vip_price','room_type_id__price','room_type_id__typename')
        datas = list(values)
        total =len(datas)
    else:
        #   到数据库去查找数据
        values = Mo.objects.filter(status=status)[(page-1)*limit:limit*page].values("id",'status',"floorno","room","floorid",'room_type_id','room_type_id__vip_price','room_type_id__price','room_type_id__typename')
        datas = list(values)
        total =len(datas)
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}

    return JsonResponse(result)


# 保存楼房信息
def add(request):
    # 0：成功，-1：不成功
    result = {"code": 0, "msg": "操作成功！！"}
    # 获取页面的数据
    room = request.POST.get("room")
    floorid = request.POST.get("floorid")
    floorno = request.POST.get("floorno")
    room_type_id = request.POST.get("room_type_id")
    # 判断一下这个楼房是否存在，如果存在，就不能添加
    u = Mo.objects.filter(room=room,floorid=floorid)
    if u:
        result["code"] = -1
        result["msg"] = "用户已经存在，不能添加！！"
    else:
        # 插到数据库里面
        m = Mo()
        m.room = room
        m.floorid = floorid
        m.floorno = floorno
        m.status = 0
        m.room_type_id = room_type_id
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
    name = request.POST.get("name")
    no = request.POST.get("no")
    floorno = request.POST.get("floorno")
    updatetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    remark = request.POST.get("remark")
    #   更新
    Mo.objects.filter(id=id).update(name=name,no=no,floorno = floorno,remark=remark,updatetime=updatetime)
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

# 获取所有数据
def get_all_list(request):
    roomStatus = request.GET.get("roomStatus")
    roomType = request.GET.get("roomType")
    roomNo = request.GET.get("roomNo")
    datas = []
    total = len(datas)
    #   到数据库去查找数据
    if roomStatus=='100' and roomType=='-1' and roomNo==None:
        values = Mo.objects.all().values('id','room','floorno','status','room_type_id','room_type_id__typename')
        datas = list(values)
        total = len(datas)
    if roomStatus!='100' and roomType=='-1' and roomNo==None:
        values = Mo.objects.filter(status=roomStatus).values('id','room','floorno','status','room_type_id','room_type_id__typename')
        datas = list(values)
        total = len(datas)
    if roomStatus=='100' and roomType == '-1' and roomNo!=None:
        values = Mo.objects.filter(room__icontains=roomNo).values('id','room','floorno','status','room_type_id','room_type_id__typename')
        datas = list(values)
        total = len(datas)
    if roomStatus!='100' and roomType!='-1' and roomNo==None:
        values = Mo.objects.filter(status=roomStatus,room_type_id=roomType).values('id','room','floorno','status','room_type_id','room_type_id__typename')
        datas = list(values)
        total = len(datas)
    if roomStatus!='100' and roomType=='-1' and roomNo!=None:
        values = Mo.objects.filter(status=roomStatus,room__icontains=roomNo).values('id','room','floorno','status','room_type_id','room_type_id__typename')
        datas = list(values)
        total = len(datas)
    if roomStatus=='100' and roomType!='-1' and roomNo!=None:
        values = Mo.objects.filter(room_type_id=roomType,room__icontains=roomNo).values('id','room','floorno','status','room_type_id','room_type_id__typename')
        datas = list(values)
        total = len(datas)
    if roomStatus=='100' and roomType!='-1' and roomNo==None:
        values = Mo.objects.filter(room_type_id=roomType).values('id','room','floorno','status','room_type_id','room_type_id__typename')
        datas = list(values)
        total = len(datas)

    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}
    return JsonResponse(result)


# 获取所有数据
def room_by_f_n(request):
    floorid = request.POST.get("floorid")
    floorno = request.POST.get("floorno")
    #   到数据库去查找数据
    values = Mo.objects.filter(floorid=floorid,floorno=floorno).values('id','room','floorno','status','room_type_id','room_type_id__vip_price','room_type_id__price')
    datas = list(values)
    total = len(datas)
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}
    return JsonResponse(result)

# 根据状态查询房间
def room_by_status(request):
    status = request.GET.get("status")
    #   到数据库去查找数据
    values = Mo.objects.filter(status=status).values('id','room','floorno','status','room_type_id','room_type_id__vip_price','room_type_id__price')
    datas = list(values)
    total = len(datas)
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}
    return JsonResponse(result)

# 根据房间号查询房间
def room_by_name(request):
    room = request.GET.get("room")
    #   到数据库去查找数据(like查询)
    values = Mo.objects.filter(room__icontains=room).values('id','room','floorno','status','room_type_id','room_type_id__vip_price','room_type_id__price')
    datas = list(values)
    total = len(datas)
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}
    return JsonResponse(result)


def rooms_q(request):
    #   到数据库去查找数据
    values = Mo.objects.all().values('id','room','floorno','status','room_type_id','room_type_id__vip_price','room_type_id__price')
    datas = list(values)
    total = len(datas)
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}
    return JsonResponse(result)


# 根据id查询房间信息
def room_by_id(request):
    id = request.GET.get("id")
    #   到数据库去查找数据
    values = Mo.objects.get(id=id)
    datas = model_to_dict(values)
    # total = len(datas)
    # 构造返回数据
    result = {"code": 0, "msg": "查询成功！！", "count": 1, "data": datas}
    return JsonResponse(result)


#   报修
def baoxiu(request):
    result = {"code": 0, "msg": "修改成功！"}
    #   获取前端的数据
    id = request.POST.get("id")
    updatetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    remark = request.POST.get("remark")
    #   更新
    Mo.objects.filter(id=id).update(remark=remark,status=-1,updatetime=updatetime)
    return JsonResponse(result)


#   保留
def baoliu(request):
    result = {"code": 0, "msg": "修改成功！"}
    #   获取前端的数据
    id = request.POST.get("id")
    status =request.POST.get("status")
    # 要注意，入住的时候不能保留
    updatetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    #   更新
    Mo.objects.filter(id=id).update(status=status,updatetime=updatetime)
    return JsonResponse(result)


#   保留
def setStatus(request):
    result = {"code": 0, "msg": "修改成功！"}
    #   获取前端的数据
    id = request.POST.get("id")
    status =request.POST.get("status")
    updatetime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    #   更新
    Mo.objects.filter(id=id).update(status=status,updatetime=updatetime)
    return JsonResponse(result)
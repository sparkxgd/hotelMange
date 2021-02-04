import datetime
from django.http import JsonResponse

from hotel.models import CheckIn as Mo

import json

# 客户入住管理


# 获取数据列表
def get_list(request):
    #   获取页面提交的数据
    page = int(request.GET.get("page"))
    limit = int(request.GET.get("limit"))
    typename = request.GET.get("typename")
    if typename:
        #   到数据库去查找数据
        values = Mo.objects.filter(typename__contains=typename)[(page-1)*limit:limit*page].values()
        datas = list(values)
        total =len(datas)
    else:
        #   到数据库去查找数据
        values = Mo.objects.all()[(page-1)*limit:limit*page].values()
        datas = list(values)
        total =len(datas)
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}

    return JsonResponse(result)


# 保存信息
def add(request):
    # 0：成功，-1：不成功
    result = {"code": 0, "msg": "操作成功！！"}
    # 获取页面的数据
    custumer_id = request.POST.get("custumer_id")
    room_id = request.POST.get("room_id")
    time_ins = request.POST.get("time_in")
    day = int(request.POST.get("day"))
    time_in = datetime.datetime.strptime(time_ins, '%Y-%m-%d %H:%M:%S')
    # 判断一下这个楼房是否存在，如果存在，就不能添加（在他入住的时间段内）?
    now = datetime.datetime.now()
    u = Mo.objects.filter(custumer_id=custumer_id,room_id=room_id,time_out__lte=now)
    if u:
        result["code"] = -1
        result["msg"] = "客户已经入住，不能添加！！"
    else:
        # 插到数据库里面
        m = Mo()
        m.custumer_id = custumer_id
        m.room_id = room_id
        m.time_in = time_in
        m.day = day
        delta = datetime.timedelta(days=day)
        n_days = time_in + delta
        m.time_out = n_days
        m.createtime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        m.updatetime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        # 真正的保存
        m.save()
    return JsonResponse(result)

#   修改、编辑
def edit(request):
    result = {"code": 0, "msg": "修改成功！"}
    #   获取前端的数据
    id = request.POST.get("id")
    typename = request.POST.get("typename")
    price = request.POST.get("price")
    vip_price = request.POST.get("vip_price")
    updatetime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    #   更新
    Mo.objects.filter(id=id).update(typename=typename,price=price,vip_price= vip_price,updatetime=updatetime)
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
    #   到数据库去查找数据
    values = Mo.objects.all().values()
    datas = list(values)
    total = len(datas)
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}
    return JsonResponse(result)


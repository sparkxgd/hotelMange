import datetime
from django.http import JsonResponse
import calendar
from hotel.models import CheckIn as Mo
from hotel.models import Bill,Room,Custumer

import json

# 客户入住、退房管理


# 获取数据列表
def get_list(request):
    #   获取页面提交的数据
    page = int(request.GET.get("page"))
    limit = int(request.GET.get("limit"))
    typename = request.GET.get("typename")
    if typename:
        #   到数据库去查找数据
        values = Mo.objects.filter(typename__contains=typename)[(page-1)*limit:limit*page].values("id","time_in","day","time_out","updatetime","custumer_id__name","custumer_id__tel","bill__id","bill__money","bill__inmoney","bill__status","room_id__room")
        datas = list(values)
        total =len(datas)
    else:
        #   到数据库去查找数据
        values = Mo.objects.all()[(page-1)*limit:limit*page].values("id","time_in","day","time_out","custumer_id","updatetime","custumer_id__name","custumer_id__tel","bill__id","bill__money","bill__inmoney","bill__status","room_id__room")
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
        room = Room.objects.filter(id=room_id).values("id",'status','room_type_id','room_type_id__vip_price','room_type_id__price','room_type_id__typename')
        custumer = Custumer.objects.filter(id=custumer_id)

        # 生成账单
        b = Bill()
        if custumer[0].type == 1:
            all_money = room[0]["room_type_id__vip_price"]*day
        else:
            all_money = room[0]["room_type_id__price"]*day
        b.money = all_money
        b.inmoney = 0
        b.room = room_id
        b.status = 1
        b.createtime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        b.updatetime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        b.save()
        # yb = Bill.objects.filter(room=b.room,status=b.status,money=b.money)

        # 插到数据库里面
        nroom = Room()
        nroom.id=room[0]["id"]
        m = Mo()
        m.bill = b
        m.custumer_id = custumer[0]
        m.room_id = nroom
        m.time_in = time_in
        m.day = day
        delta = datetime.timedelta(days=day)
        n_days = time_in + delta
        m.time_out = n_days
        m.createtime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        m.updatetime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        # 真正的保存
        m.save()
        updatetime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        # 更新房间状态
        Room.objects.filter(id=nroom.id).update(status=1, updatetime=updatetime)
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


# 获取退房数据列表
def get_out_list(request):
    #   获取页面提交的数据
    page = int(request.GET.get("page"))
    limit = int(request.GET.get("limit"))
    no = request.GET.get("no")
    if no:
        #   到数据库去查找数据
        values = Room.objects.filter(no__contains=no, status=1)[(page - 1) * limit:limit * page].values('id','room','floorno','status','room_type_id','room_type_id__typename','room_type_id__vip_price','room_type_id__price')
        datas = list(values)
        total = len(datas)
    else:
        #   到数据库去查找数据
        values = Room.objects.filter(status=1)[(page - 1) * limit:limit * page].values('id','room','floorno','status','room_type_id','room_type_id__typename','room_type_id__vip_price','room_type_id__price')
        datas = list(values)
        total = len(datas)
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}

    return JsonResponse(result)

# 退房
def checkout(request):
    result = {"code": 0, "msg": "退房成功！"}
    #   获取前端的数据
    roomid = request.POST.get("id")
    updatetime = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    #   判断是否已经结账(values)
    b = Bill.objects.filter(room=roomid)
    if b[0].status == 0:
        #   更新房间状态为未打扫
        Room.objects.filter(id=roomid).update(status=-2, updatetime=updatetime)
    else:
        result = {"code": 0, "msg": "该房间未结账，请结账！！！退房失败！"}
    return JsonResponse(result)


# 获取预计今日退房的
def checkout_num_by_day(request):
    day = datetime.datetime.now().strftime("%Y-%m-%d")
    #   今日
    num = Mo.objects.filter(time_out__contains=day).values('room_id').distinct().order_by('room_id').count()
    result = {"code": 0, "msg": "查询成功！",
              "data": {"num": num}}
    return JsonResponse(result)


# 入住统计(今日,昨日，本月，今年入住的人数)
def getChecinNum(request):
    day = datetime.datetime.now().strftime("%Y-%m-%d")
    month = datetime.datetime.now().strftime("%Y-%m")
    year = datetime.datetime.now().strftime("%Y")
    delta = datetime.timedelta(days=1)
    time_in = datetime.datetime.strptime(day, '%Y-%m-%d')
    ysday = time_in - delta
    yesday = ysday.strftime("%Y-%m-%d")
    #   今日
    dayNum = Mo.objects.filter(time_in__contains=day).count()
    yesdayNum = Mo.objects.filter(time_in__contains=yesday).count()
    monthNum = Mo.objects.filter(time_in__contains=month).count()
    yearNum = Mo.objects.filter(time_in__contains=year).count()
    result = {"code": 0, "msg": "查询成功！", "data": {"dayNum": dayNum, "yesdayNum": yesdayNum, "monthNum": monthNum, "yearNum": yearNum}}
    return JsonResponse(result)


# 入住统计图形(本月入住的人数)
def getCheckinNumForEchartMonth(request):
    d = datetime.datetime.now()
    month = d.strftime("%Y-%m")
    checkin_list = Mo.objects.filter(time_in__contains=month).values()
    year = d.year
    month = d.month

    # 本月有多少天
    totalDay = calendar.monthrange(year, month)[1]
    dayName = []
    dayNum = []
    for n in range(1,totalDay):
        # 获取本月的第n天
        this_month_day = datetime.datetime(d.year, d.month, n)
        day = this_month_day.strftime("%m-%d")
        dayName.append(day)
        num = 0
        for m in checkin_list:
            if(day in str(m["time_in"])):
                num += 1

        dayNum.append(num)
    result = {"code": 0, "msg": "查询成功！", "data": {"dayName": dayName, "dayNum": dayNum}}
    return JsonResponse(result)


# 入住统计图形(今年入住的人数)
def getCheckinNumForEchartYear(request):
    d = datetime.datetime.now()
    year = d.strftime("%Y")
    checkin_list = Mo.objects.filter(time_in__contains=year).values()
    dayName = []
    dayNum = []
    for n in range(1, 13):
        # 获取本月的第n天
        this_year_start = datetime.datetime(d.year, n, 1)
        day = this_year_start.strftime("%Y-%m")
        dayName.append(day)
        num = 0
        for m in checkin_list:
            if (day in str(m["time_in"])):
                num += 1

        dayNum.append(num)
    result = {"code": 0, "msg": "查询成功！", "data": {"dayName": dayName, "dayNum": dayNum}}
    return JsonResponse(result)
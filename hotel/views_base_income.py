import datetime
from django.http import JsonResponse

from hotel.models import Income as Mo
from hotel.models import Bill
import json
from django.db.models import Sum  # 引入

# 收支管理


# 获取数据列表
def get_list(request):
    #   获取页面提交的数据
    page = int(request.GET.get("page"))
    limit = int(request.GET.get("limit"))
    id = request.GET.get("id")
    if id:
        #   到数据库去查找数据
        values = Mo.objects.filter(id__contains=id)[(page-1)*limit:limit*page].values()
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


# 获取退房数据列表
def get_out_list(request):
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


# 账单缴费
def bill_income(request):
    # 0：成功，-1：不成功
    result = {"code": 0, "msg": "操作成功！！"}
    # 获取页面的数据
    remark = request.POST.get("remark")
    money = request.POST.get("money")
    inType = int(request.POST.get("inType"))
    bill = request.POST.get("bill")
    # 判断一下这个楼房是否存在，如果存在，就不能添加（在他入住的时间段内）?
    # 插到数据库里面
    m = Mo()
    m.remark = remark
    m.money = money
    m.in_type = inType
    m.bill = bill
    m.type = 0
    m.create_time = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    # 真正的保存
    m.save()

    # 更新账单表
    Bill.objects.filter(id=bill).update(status=0,inmoney=0,updatetime=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"))

    return JsonResponse(result)


# 收入统计(今日,昨日，本月，今年收入)
def getIncomeNum(request):
    day = datetime.datetime.now().strftime("%Y-%m-%d")
    month = datetime.datetime.now().strftime("%Y-%m")
    year = datetime.datetime.now().strftime("%Y")
    delta = datetime.timedelta(days=1)
    time_in = datetime.datetime.strptime(day, '%Y-%m-%d')
    ysday = time_in - delta
    yesday = ysday.strftime("%Y-%m-%d")
    #   今日
    dayNum = Mo.objects.filter(create_time__contains=day).aggregate(nums=Sum('money'))
    yesdayNum = Mo.objects.filter(create_time__contains=yesday).aggregate(nums=Sum('money'))
    monthNum = Mo.objects.filter(create_time__contains=month).aggregate(nums=Sum('money'))
    yearNum = Mo.objects.filter(create_time__contains=year).aggregate(nums=Sum('money'))
    dn = dayNum['nums']
    if(dayNum['nums']==None):
        dn = 0
    yn = yesdayNum['nums']
    if (yesdayNum['nums'] == None):
        yn = 0
    result = {"code": 0, "msg": "查询成功！", "data": {"dayNum": dn, "yesdayNum": yn, "monthNum": monthNum['nums'], "yearNum": yearNum['nums']}}
    return JsonResponse(result)


# 收入统计图形(今年收入)
def getIncomeNumForEchartYear(request):
    d = datetime.datetime.now()
    year = d.strftime("%Y")
    income_list = Mo.objects.filter(create_time__contains=year).values()
    dayName = []
    dayNum = []
    for n in range(1, 13):
        # 获取本月的第n天
        this_year_start = datetime.datetime(d.year, n, 1)
        day = this_year_start.strftime("%Y-%m")
        dayName.append(day)
        num = 0
        for m in income_list:
            if (day in str(m["create_time"])):
                num += m["money"]

        dayNum.append(num)
    result = {"code": 0, "msg": "查询成功！", "data": {"dayName": dayName, "dayNum": dayNum}}
    return JsonResponse(result)
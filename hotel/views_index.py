import datetime
from django.http import JsonResponse
from hotel.models import CheckIn
from hotel.models import Income
from django.db.models import Sum  # 引入

# 入住统计图形(今年入住的人数)、收入统计图形(今年收入)
def getTotalForEchartYear(request):
    d = datetime.datetime.now()
    year = d.strftime("%Y")
    checkin_list = CheckIn.objects.filter(time_in__contains=year).values()
    income_list = Income.objects.filter(create_time__contains=year).values()
    dayName = []
    dayNum = []
    Moneynum =[]
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

        money = 0
        for m in income_list:
            if (day in str(m["create_time"])):
                money += m["money"]

        Moneynum.append(money)
    result = {"code": 0, "msg": "查询成功！", "day_data": {"dayName": dayName, "dayNum": dayNum},"money_data": {"ame": dayName, "num": Moneynum},}
    return JsonResponse(result)


# 入住、收入统计(本月，今年)
def getTotalNum(request):
    month = datetime.datetime.now().strftime("%Y-%m")
    year = datetime.datetime.now().strftime("%Y")
    monthNum = CheckIn.objects.filter(time_in__contains=month).count()
    yearNum = CheckIn.objects.filter(time_in__contains=year).count()


    monthMoney = Income.objects.filter(create_time__contains=month).aggregate(nums=Sum('money'))
    yearMoney = Income.objects.filter(create_time__contains=year).aggregate(nums=Sum('money'))
    dn = monthMoney['nums']
    if(monthMoney['nums']==None):
        dn = 0
    yn = yearMoney['nums']
    if (yearMoney['nums'] == None):
        yn = 0
    result = {"code": 0, "msg": "查询成功！", "data": {"monthNum":monthNum, "yearNum": yearNum,"monthMoney": dn, "yearMoney": yn}}

    return JsonResponse(result)


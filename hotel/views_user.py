from django.shortcuts import render
from django.http import JsonResponse

from hotel import models

# 用户管理


# 获取用户数据
def get_list(request):
    # 到数据库里面找数据
    values = models.User.objects.all().values()
    # 强制转换为list
    datas = list(values)
    # 数据总共条数
    total = models.User.objects.all().count()
    # 构造返回数据
    if total == 0:
        result = {"code": -1, "msg": "暂无数据！！！", "count": total, "data": datas}
    else:
        result = {"code": 0, "msg": "查询成功！！", "count": total, "data": datas}

    return JsonResponse(result)

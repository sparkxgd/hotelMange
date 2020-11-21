from django.shortcuts import render

# 打开首页
def index(request):
    return render(request,"index.html")


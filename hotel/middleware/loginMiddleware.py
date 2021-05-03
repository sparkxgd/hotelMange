from django.utils.deprecation import MiddlewareMixin
from django.shortcuts import redirect

#   控制登录的中间件
class LoginMiddleware(MiddlewareMixin):
    #   请求控制
    def process_request(self, request):
        # #   如果还没有登录，必须跳转到login页面
        user = request.session.get("username", None)
        if '/openlogin/' in request.path:
            pass
        elif '/login/' in request.path:
            pass
        elif user:
            pass
        else:
            return redirect("/openlogin/")


    # def process_request(self,request):
    # def process_view(self, request, view_func, view_args, view_kwargs)
    # def process_template_response(self,request,response)
    # def process_exception(self, request, exception)
    # def process_response(self, request, response)

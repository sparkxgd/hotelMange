{
  "code": 0
  ,"msg": ""
  ,"data": [{
    "title": "酒店管理"
    ,"name":"hotelMange"
    ,"icon": "layui-icon-home"
    ,"list": [{
      "name": "rooms"
      ,"title": "房态图"
    }, {
      "name": "homepage2"
      ,"title": "入住管理"
      ,"jump": "home/homepage2"
    }, {
      "name": "homepage2"
      ,"title": "退房管理"
      ,"jump": "home/homepage2"
    }, {
      "name": "homepage2"
      ,"title": "会员管理"
      ,"jump": "home/homepage2"
    }]
  },

  {
    "title": "统计中心"
    ,"icon": "layui-icon-survey"
    ,"list": [{
      "name": "homepage1"
      ,"title": "入住统计"
       ,"icon": "layui-icon-survey"
      ,"jump": "home/homepage1"
    }, {
      "name": "homepage2"
      ,"title": "收支统计"
      ,"jump": "home/homepage2"
    }]
  },
    {
    "title": "后台管理"
    ,"icon": "layui-icon-home"
    ,"list": [{
      "name": "homepage1"
      ,"title": "基本信息"
      ,"jump": "home/homepage1"
    }, {
      "name": "userlist"
      ,"title": "用户管理"
        ,"jump": "user/administrators/list"
    }, {
      "name": "homepage2"
      ,"title": "权限管理"
      ,"jump": "home/homepage2"
    }, {
      "name": "floor"
      ,"title": "楼房管理"
      ,"jump": "baseMange/floor/list"
    }]
  },
   {
    "name": "set"
    ,"title": "设置"
    ,"icon": "layui-icon-set"
    ,"list": [{
      "name": "system"
      ,"title": "系统设置"
      ,"spread": true
      ,"list": [{
        "name": "website"
        ,"title": "网站设置"
      },{
        "name": "email"
        ,"title": "邮件服务"
      }]
    },{
      "name": "user"
      ,"title": "个人中心"
      ,"spread": true
      ,"list": [{
        "name": "info"
        ,"title": "基本资料"
      },{
        "name": "password"
        ,"title": "修改密码"
      }]
    }]
  }]
}
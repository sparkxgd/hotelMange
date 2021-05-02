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
      "name": "checkin"
      ,"title": "入住管理"
      ,"jump": "hotelMange/checkin/list"
    }, {
      "name": "homepage2"
      ,"title": "退房管理"
      ,"jump": "hotelMange/checkout/list"
    }, {
      "name": "custumer"
      ,"title": "客户管理"
      ,"jump": "hotelMange/custumer/list"
    }, {
      "name": "income"
      ,"title": "收支管理"
      ,"jump": "hotelMange/income/list"
    }]
  },

  {
    "title": "统计中心"
    ,"icon": "layui-icon-survey"
    ,"list": [{
      "name": "checkinStatistics"
      ,"title": "入住统计"
       ,"icon": "layui-icon-survey"
      ,"jump": "hotelMange/statistics/checkin/list"
    }, {
      "name": "incomeStatistics"
      ,"title": "收支统计"
      ,"jump": "hotelMange/statistics/income/list"
    }]
  },
    {
    "title": "后台管理"
    ,"icon": "layui-icon-home"
    ,"list": [{
      "name": "userlist"
      ,"title": "用户管理"
        ,"jump": "user/administrators/list"
    }, {
        "name": "roomtype"
        ,"title": "房间类型管理"
        ,"jump": "baseMange/roomtype/list"
        },{
      "name": "floor"
      ,"title": "楼房管理"
      ,"jump": "baseMange/floor/list"
    },{
        "name": "room"
        ,"title": "房间管理"
        ,"jump": "baseMange/room/list"
    }]
  },
   {
     "icon": "layui-icon-set",
      "name": "user"
      ,"title": "个人中心"
      ,"spread": true
      ,"list": [{
        "name": "info"
        ,"title": "基本资料"
       ,"jump": "set/user/info"
      },{
        "name": "password"
        ,"title": "修改密码"
       ,"jump": "set/user/password"
      }]
  }]
}
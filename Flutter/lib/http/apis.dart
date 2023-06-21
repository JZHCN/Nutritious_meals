import 'request.dart';

class Apis {
  // 测试
  // static Future getData() async {
  //   final data = await Request().get("https://v1.hitokoto.cn/");

  //   return data;
  // }

  // 随机推荐
  static Future recommend() async {
    try {
      final res = await Request().get("/recommend/randomrecommendfood");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 按用户推荐
  static Future recommendForUser(int userId) async {
    try {
      final res =
          await Request().get("/recommend/recommendfood?userid=${userId}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 登录
  static Future login(Map<String, dynamic> params) async {
    try {
      final res = await Request().get("/login/login", data: params);
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 获取收藏列表
  static Future getStore(int id) async {
    try {
      final res = await Request().get("/collection/findByUserid?userid=$id");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 添加收藏
  static Future addStore(int userId, int foodId) async {
    try {
      final res = await Request()
          .get("/collection/addcollection?userid=${userId}&foodid=${foodId}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 查询是否已收藏
  static Future isStore(int userId, int foodId) async {
    try {
      final res = await Request().get(
          "/collection/findByUseridAndFoodid?userid=${userId}&foodid=${foodId}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 根据id查询食物
  static Future getFoodById(int id) async {
    try {
      final res = await Request().get("/food/findby/${id}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 获取所有食物
  static Future getAllFood() async {
    try {
      final res = await Request().get("/food/findall");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 按分类获取食物
  static Future getFoodByNutritious(int id) async {
    try {
      final res = await Request().get("/food/findbynutritype/${id}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 模糊查询食物
  static Future getFoodByLike(String name) async {
    try {
      final res =
          await Request().get("/food/findbyfoodnamelike?foodname=${name}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 获取全部订单
  static Future getAllOrder(int id) async {
    try {
      var res = await Request().get("/orders/findbyuserid?userid=${id}");

      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 按状态获取订单
  static Future getOrderByType(int userId, int type) async {
    try {
      var res = await Request()
          .get("/orders/findbyuseridandtype?userid=$userId&type=$type");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 修改订单状态
  static Future changeOrderType(int orderId, int type) async {
    try {
      var res =
          await Request().get("/orders/changetype?id=${orderId}&type=${type}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 添加订单
  static Future addOrder(
    int userId,
    double totalPrice,
    String pickupTimeStart,
    String pickupTimeEnd,
  ) async {
    try {
      var res = await Request().get(
          "/orders/addorders?userid=${userId}&totalprice=${totalPrice}&pickuptimestart=${pickupTimeStart}&pickuptimeend=${pickupTimeEnd}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 添加订单详情
  static Future addOrderDetail(
      int userId, int orderId, Map<String, dynamic> data) async {
    try {
      var res = await Request().post(
          "/orderdetail/addorderdetail?userid=${userId}&orderid=${orderId}",
          data: data);
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 根据订单id获取订单详情
  static Future getOrderDetail(int id) async {
    try {
      var res = await Request()
          .get("/orderdetail/findorderdetailbyorderid?orderid=$id");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 查询购物车
  static Future getCar(int id) async {
    try {
      var res = await Request().get("/cart/findbyuserid?userid=$id");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 加入购物车
  static Future addCar(int userId, int foodId,
      [quantity = 1, businessId = 1]) async {
    try {
      var res = await Request().get(
          "/cart/addincart?userid=${userId}&foodid=${foodId}&quantity=${quantity}&businessid=${businessId}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 查询购物车食物详情
  static Future getCarFood(int id) async {
    try {
      var res = await Request().get("/cart/findfoodbyuserid?userid=$id");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 获取评价
  static Future getComment(int id) async {
    try {
      var res = await Request().get("/comment/findByFoodid?foodid=${id}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }

  // 获取用户
  static Future getUser(int id) async {
    try {
      var res = await Request().get("/user/findbyid?id=${id}");
      return res;
    } catch (e) {
      print('请求出现错误：$e');
    }
  }
}

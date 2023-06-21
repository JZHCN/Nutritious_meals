import 'package:fluro/fluro.dart';
import 'handler.dart';

class Routes {
  // 定义路由名称
  static String home = '/';
  static String foodDetail = '/detail/:id';
  static String order = '/order';
  static String myOrder = '/myOrder';
  static String store = '/store';
  static String search = '/search/:search';
  static String pickup = '/pickup';
  static String consumption = '/consumption';
  static String loading = '/loading';
  static String login = '/login';
  static String register = '/register';

  // configureRoutes 管理路由名称和处理函数
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = notFoundHandler;

    router.define(home, handler: homeHandler);
    router.define(foodDetail, handler: foodDetailHandler);
    router.define(order, handler: orderHandler);
    router.define(myOrder, handler: myOrderHandler);
    router.define(store, handler: storeHandler);
    router.define(search, handler: searchResultHandler);
    router.define(pickup, handler: pickUpMealsHandler);
    router.define(consumption, handler: consumptionHandler);
    router.define(loading, handler: loadingHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
  }
}

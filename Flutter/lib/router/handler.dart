import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/consumption/index.dart';
import '../pages/search_result/index.dart';
import '../pages/pick_up_meals/index.dart';
import '../login.dart';
import '../pages/order/index.dart';
import '../pages/my_order/index.dart';
import '../pages/store/index.dart';
import '../pages/home/index.dart';
import '../pages/food_detail/index.dart';
import '../pages/loading.dart';
import '../pages/not_found.dart';
import '../register.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Home();
});

// 菜品详情
var foodDetailHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const FoodDetail();
});

// 订单详情
var orderHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  // var id = params["id"]?[0];
  // if (id != null) {
  // return Order(id: params["id"]![0]);
  return const Order();
  // } else {
  //   return const NotFound();
  // }
});

// 我的订单
var myOrderHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const MyOrder();
});

// 商品收藏
var storeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Store();
  // var id = params["id"]?[0];
  // if (id != null) {
  //   return const Store();
  // } else {
  //   return const NotFound();
  // }
});

// 取餐点
var pickUpMealsHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const PickUpMeals();
});

// 消费点
var consumptionHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  return const Consumption();
});

// 查询结果
var searchResultHandler =
    Handler(handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
  String search = params["search"][0];
  return SearchResult(search: search);
});

// 404
var notFoundHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const NotFound();
});

// 加载页面
var loadingHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Loading();
});

// 登录
var loginHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Login();
});

// 注册
var registerHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const Register();
});

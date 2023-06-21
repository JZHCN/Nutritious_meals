import 'package:flutter/material.dart';
import 'package:nutritious_meals/model/order.dart';
import 'components/canteen_order.dart';
import 'components/order_search.dart';
import '../../../http/apis.dart';
import '../../../utils/storage.dart';
import 'dart:convert';
import 'package:collection/collection.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> with SingleTickerProviderStateMixin {
  final List<String> categories = ["全部", "待付款", "待取餐", "待评价", "退款/售后"];

  late TabController _controller;

  List<dynamic> allOrder = []; // 全部订单

  // 获取用户全部订单
  getOrderList() async {
    // 获取用户id
    var user = await Storage.readStorage("user");
    if (user != null && user.isNotEmpty) {
      user = jsonDecode(user);
      var id = int.parse(user["id"]);
      var res = await Apis.getAllOrder(id);
      // print(res);
      setState(() {
        allOrder = res["data"];
      });
      // print(allOrder.length);
    } else {
      print("用户信息为空");
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: categories.length, vsync: this);
    getOrderList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> dfk =
        allOrder.where((element) => element["type"] == 1).toList(); // 待付款订单
    List<dynamic> dqc =
        allOrder.where((element) => element["type"] == 2).toList(); // 待取餐
    List<dynamic> dpj =
        allOrder.where((element) => element["type"] == 3).toList(); // 待评价
    List<dynamic> sh =
        allOrder.where((element) => element["type"] == 4).toList(); // 退款/售后
    // TabBarView列表
    final tabs = [
      // 添加不同的内容
      ListView.builder(
          itemCount: allOrder.length,
          itemBuilder: (BuildContext context, int index) {
            // print(index);
            return CanteenOrder(
                order: allOrder[index], getOrderList: getOrderList);
          }),
      ListView.builder(
          itemCount: dfk.length,
          itemBuilder: (BuildContext context, int index) {
            return CanteenOrder(order: dfk[index], getOrderList: getOrderList);
          }),
      ListView.builder(
          itemCount: dqc.length,
          itemBuilder: (BuildContext context, int index) {
            return CanteenOrder(order: dqc[index], getOrderList: getOrderList);
          }),
      ListView.builder(
          itemCount: dpj.length,
          itemBuilder: (BuildContext context, int index) {
            return CanteenOrder(order: dpj[index], getOrderList: getOrderList);
          }),
      ListView.builder(
          itemCount: sh.length,
          itemBuilder: (BuildContext context, int index) {
            return CanteenOrder(order: sh[index], getOrderList: getOrderList);
          }),
    ];

    return DefaultTabController(
        length: categories.length,
        child: Scaffold(
            appBar: AppBar(
              title: const Text("我的订单"),
              centerTitle: true,
              backgroundColor: Colors.white,
            ),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              // color: const Color(0xfff7f8f7),
              child: Column(
                children: [
                  const OrderSearch(),
                  Container(
                    color: Colors.white,
                    child: TabBar(
                      isScrollable: true,
                      controller: _controller,
                      tabs: categories.map((String category) {
                        return Tab(text: category);
                      }).toList(),
                    ),
                  ),
                  Expanded(
                      child: TabBarView(
                    controller: _controller,
                    children: tabs.map((tab) {
                      return Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          height: double.infinity,
                          color: const Color(0xfff7f8f7),
                          child: tab);
                    }).toList(),
                  ))
                ],
              ),
            )));
  }
}

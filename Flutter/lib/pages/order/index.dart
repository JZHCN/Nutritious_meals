import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nutritious_meals/http/apis.dart';
import 'components/pick_up_time.dart';
import 'components/pick_up_meals.dart';
import 'components/canteen_order.dart';
import 'components/order_message.dart';
import 'components/payment.dart';

class Order extends StatefulWidget {
  // final String id;
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  Map<String, dynamic> orderDetail = {};
  // List

  getOrderDetail() {
    // print(ModalRoute.of(context)!.settings.arguments);
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var jsonString = ModalRoute.of(context)!.settings.arguments as String;
      setState(() {
        orderDetail = jsonDecode(jsonString);
      });
    } else {
      print("未接收到json参数");
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getOrderDetail();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.id);
    print(orderDetail);
    return Scaffold(
        appBar: AppBar(
          title: const Text("订单结算"),
          centerTitle: true,
          backgroundColor: Colors.white,
          // shape: Border(
          //   bottom: BorderSide(color: Color(0xffeeeeee), width: 1)
          //     ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height, // 获取当前屏幕高度
          color: const Color(0xfff7f8f7),
          child: orderDetail.isNotEmpty
              ? ListView(
                  children: [
                    PickUpMeals(),
                    PickUpTime(
                      pickuptimestart: orderDetail["pickuptimestart"],
                      pickuptimeend: orderDetail["pickuptimeend"],
                    ),
                    CanteenOrder(foodList: orderDetail["orderdetailList"]),
                    OrderMessage(orderDetail: orderDetail),
                    Payment(
                      orderDetail: orderDetail,
                    ),
                  ],
                )
              : const Center(
                  child: Text("订单为空！"),
                ),
        ));
  }
}

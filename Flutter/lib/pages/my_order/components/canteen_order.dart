import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:nutritious_meals/components/base_toast.dart';

import '../../../http/apis.dart';

class CanteenOrder extends StatefulWidget {
  final Map order;
  final Function getOrderList;
  const CanteenOrder(
      {Key? key, required this.order, required this.getOrderList})
      : super(key: key);

  @override
  State<CanteenOrder> createState() => _CanteenOrderState();
}

class _CanteenOrderState extends State<CanteenOrder> {
  List<dynamic> orderDetail = []; // 订单详情

  // 获取订单状态
  String getStateByType([int type = 0]) {
    switch (type) {
      case 1:
        return "待付款";
      case 2:
        return "待取餐";
      case 3:
        return "待评价";
      case 4:
        return "退款/售后";
      default:
        return "";
    }
  }

  // 修改订单状态文本
  String setButtonTextByType([int type = 0]) {
    switch (type) {
      case 1:
        return "立即支付";
      case 2:
        return "立即取餐";
      case 3:
        return "立即评价";
      case 4:
        return "退款/售后";
      default:
        return "";
    }
  }

  // 修改订单状态
  changeOrderType(Map order) async {
    // 最高状态是4，不需要更新了
    if (widget.order["type"] == 4)
      return;
    else if (widget.order["type"] == 1) {
      toOrder(order);
    } else {
      var res = await Apis.changeOrderType(
          widget.order["id"], widget.order["type"] + 1);
      if (res["code"] == 200) {
        BaseToast.successToast("成功！");

        widget.getOrderList();
      } else {
        BaseToast.failToast("失败！");
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // getOrderDetail();
    orderDetail = widget.order["orderdetailList"];
  }

  // 支付
  void toOrder(Map order) {
    String jsonString = jsonEncode(order);
    Navigator.of(context).pushNamed("/order", arguments: jsonString);
    // print(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    // print("111+$orderDetail");
    // print("222+${widget.order}");

    // 订单状态
    final state = getStateByType(widget.order["type"]);
    final buttonText = setButtonTextByType(widget.order["type"]);

    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Text(
                        "知味堂三楼",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        size: 18,
                      )
                    ],
                  ),
                  Text(
                    state,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              )),
          // 商品
          ...List.generate(orderDetail.length, (index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Color(0xfff4f4f4), width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          orderDetail[index]["img"],
                          width: 75,
                          height: 65,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        // width: 600,
                        margin: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  orderDetail[index]["foodname"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff999999),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: const Text(
                                    "午餐",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                orderDetail[index]["description"],
                                // "优选鲜肉，不加任何添加剂",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12, color: Color(0xff999999)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "￥ ${orderDetail[index]["price"]}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "x ${orderDetail[index]["quantity"]}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
          // 总计
          Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Color(0xfff4f4f4), width: 1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("共${orderDetail.length}件商品，金额：",
                        style:
                            TextStyle(fontSize: 10, color: Color(0xff999999))),
                    Text("￥${widget.order["totalprice"]}",
                        style: const TextStyle(fontSize: 10)),
                  ],
                ),
                Row(
                  children: [
                    Text(widget.order["ordertime"].replaceAll("T", " ").substring(0,19),
                        style: TextStyle(fontSize: 10)),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                          color: const Color(0xff666666),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextButton(
                          onPressed: () {
                            changeOrderType(widget.order);
                          },
                          child: Text(buttonText,
                              style: const TextStyle(
                                  color: Colors.white,
                                fontSize: 12
                              )
                          )),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

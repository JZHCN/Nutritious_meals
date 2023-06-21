import 'package:flutter/material.dart';

class UserOrder extends StatefulWidget {
  const UserOrder({Key? key}) : super(key: key);

  @override
  State<UserOrder> createState() => _UserOrderState();
}

class _UserOrderState extends State<UserOrder> {
  // 跳转到我的订单
  void toMyOrder() {
    Navigator.pushNamed(context, "/myOrder");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: GestureDetector(
              onTap: toMyOrder,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "我的订单",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    color: Color(0xff919291),
                  ),
                ],
              ),
            )),
        Container(
          margin: const EdgeInsets.only(top: 3),
          padding: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 40,
                    height: 40,
                    color: const Color(0xffffffff),
                    child: const Icon(Icons.payment_outlined, size: 30),
                  ),
                  const Text(
                    "代付款",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 40,
                    height: 40,
                    color: const Color(0xffffffff),
                    child:
                        const Icon(Icons.breakfast_dining_outlined, size: 30),
                  ),
                  const Text("代取餐",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 40,
                    height: 40,
                    color: const Color(0xffffffff),
                    child: const Icon(
                      Icons.message_outlined,
                      size: 30,
                    ),
                  ),
                  const Text("代评价",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 40,
                    height: 40,
                    color: const Color(0xffffffff),
                    child: const Icon(Icons.monetization_on_outlined, size: 30),
                  ),
                  const Text("退款/售后",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

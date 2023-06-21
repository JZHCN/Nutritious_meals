import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderMessage extends StatefulWidget {
  final Map<String, dynamic> orderDetail;
  const OrderMessage({Key? key, required this.orderDetail}) : super(key: key);

  @override
  State<OrderMessage> createState() => _OrderMessageState();
}

class _OrderMessageState extends State<OrderMessage> {
  String orderTime = "";

  @override
  void initState() {
    super.initState();
    DateTime time = DateTime.parse(widget.orderDetail["ordertime"]);
    orderTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(time.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("订单编号",
                      style: TextStyle(color: Color(0xff999999), fontSize: 12)),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(widget.orderDetail["id"].toString(),
                        style: const TextStyle(fontSize: 12)),
                  )
                ],
              ),
              Container(
                // margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff999999), width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child: const Text(
                  "复制",
                  style: TextStyle(fontSize: 10, color: Color(0xff999999)),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const Text("下单时间",
                    style: TextStyle(color: Color(0xff999999), fontSize: 12)),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(orderTime, style: const TextStyle(fontSize: 12)),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Row(
              children: [
                Text("支付方式",
                    style: TextStyle(color: Color(0xff999999), fontSize: 12)),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("一卡通支付", style: TextStyle(fontSize: 12)),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const Row(
              children: [
                Text("备注信息",
                    style: TextStyle(color: Color(0xff999999), fontSize: 12)),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text("无", style: TextStyle(fontSize: 12)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

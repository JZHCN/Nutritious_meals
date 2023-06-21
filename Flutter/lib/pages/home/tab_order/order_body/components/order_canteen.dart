import 'package:flutter/material.dart';

class OrderCanteen extends StatefulWidget {
  const OrderCanteen({Key? key}) : super(key: key);

  @override
  State<OrderCanteen> createState() => _OrderCanteenState();
}

class _OrderCanteenState extends State<OrderCanteen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Icon(
                  Icons.favorite,
                  color: Color(0xffFFA940),
                  size: 16,
                ),
              ),
              const Text(
                "知味堂三楼",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/consumption");
            },
            child: const Row(
              children: [
                Text(
                  "切换消费点",
                  style: TextStyle(color: Color(0xff1582FC)),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xff919291),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

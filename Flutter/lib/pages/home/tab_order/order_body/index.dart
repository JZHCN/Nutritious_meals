import 'package:flutter/material.dart';
import 'components/order_canteen.dart';
import 'components/order_search.dart';
import 'components/order_time.dart';
import 'components/order_food.dart';

class OrderBody extends StatelessWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff7f8f7),
      child: const Column(
        children: [
          OrderSearch(),  // 搜索框
          OrderCanteen(), // 食堂选择
          OrderTime(),  // 三餐选择及供应时间
          OrderFood(),  // 窗口食品选择
        ],
      ),
    );
  }
}

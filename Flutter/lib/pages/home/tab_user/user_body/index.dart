import 'package:flutter/material.dart';
import 'components/user_order.dart';
import 'components/id_cart.dart';
import 'components/user_info.dart';
import 'components/user_store.dart';
import 'components/user_tool.dart';

class UserBody extends StatelessWidget {
  const UserBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff7f8f7),
      child: Column(
        children: [
          // 学生信息
          Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: const Column(
                children: [
                  // 个人信息
                  UserInfo(),
                  // 收藏
                  UserStore(),
                  // 一卡通
                  IdCart(),
                ],
              )),
          // 订单
          Container(
            padding: const EdgeInsets.all(10),
            child: const UserOrder(),
          ),
          // 工具
          Container(
            padding: const EdgeInsets.all(10),
            child: const UserTool(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../http/apis.dart';
import 'tab_order/index.dart';
import 'tab_index/index.dart';
import 'tab_user/index.dart';
import 'tab_car/index.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; // 底部导航 当前选中索引

  // 底部导航栏列表 ui
  List<BottomNavigationBarItem> barItemList = [
    const BottomNavigationBarItem(label: "首页", icon: Icon(Icons.home)),
    const BottomNavigationBarItem(label: "点餐", icon: Icon(Icons.category)),
    const BottomNavigationBarItem(
        label: "购物车", icon: Icon(Icons.shopping_cart)),
    const BottomNavigationBarItem(label: "我的", icon: Icon(Icons.person)),
  ];

  // 底部导航栏对应渲染在body的 Widget
  List<Widget> tabList = [
    const TabIndex(),
    const TabCategory(),
    const TabCar(),
    const TabUser(),
  ];

  // 底部导航栏点击事件
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: tabList[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        // type: BottomNavigationBarType.fixed, // 固定在底部
        items: barItemList,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        onTap: _onItemTapped,
        backgroundColor: const Color(0xfff7f8f7),
        elevation: 0,
      ),

      //测试接口 成功
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Apis.getData().then((value) {
      //       print("测试：${value["hitokoto"]}");
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

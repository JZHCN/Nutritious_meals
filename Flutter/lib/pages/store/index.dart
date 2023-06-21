import 'dart:convert';

import 'package:flutter/material.dart';
import '../../http/apis.dart';
import '../../utils/storage.dart';
import 'components/business.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  List<dynamic> storeList = [];
  // 获取用户收藏列表
  getStoreList() async {
    // 获取用户id
    var user = await Storage.readStorage("user");
    // print(user);
    if (user != null && user.isNotEmpty) {
      user = jsonDecode(user);
      var id = int.parse(user["id"]);
      var res = await Apis.getStore(id);
      setState(() {
        storeList = res["data"];
      });
      // print(storeList[0]);
    } else {
      print("用户信息为空");
    }
  }

  @override
  void initState() {
    super.initState();
    getStoreList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("收藏商品"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height, // 获取当前屏幕高度
          color: const Color(0xfff7f8f7),
          child: ListView.builder(
              itemCount: storeList.length,
              itemBuilder: (BuildContext context, int index) {
                // print("???$index");
                return Business(
                  food: storeList[index],
                );
              }),
        ));
  }
}

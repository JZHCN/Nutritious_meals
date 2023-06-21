import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../http/apis.dart';
import '../../../../../utils/storage.dart';

class UserStore extends StatefulWidget {
  const UserStore({Key? key}) : super(key: key);

  @override
  State<UserStore> createState() => _UserStoreState();
}

class _UserStoreState extends State<UserStore> {
  List<dynamic> storeList = [];
  // 获取用户id
  var user = {};
  // 获取用户收藏列表
  getStoreList() async {
    var userStorage = await Storage.readStorage("user");
    // print(user);
    if (userStorage != null && userStorage.isNotEmpty) {
      user = jsonDecode(userStorage);
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

  // 跳转到我的收藏
  void toStore() {
    Navigator.pushNamed(context, "/store");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: toStore,
            child: Column(
              children: [
                Text(storeList.length.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const Text("收藏商品")
              ],
            ),
          ),
          user.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/consumption");
                  },
                  child: const Column(
                    children: [
                      Text("1",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("收藏消费点")
                    ],
                  ),
                )
              : const Column(
                  children: [
                    Text("0",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("收藏消费点")
                  ],
                ),
          user.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/pickup");
                  },
                  child: const Column(
                    children: [
                      Text("1",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("收藏取餐点")
                    ],
                  ),
                )
              : const Column(
                  children: [
                    Text("0",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("收藏取餐点")
                  ],
                ),
        ],
      ),
    );
  }
}

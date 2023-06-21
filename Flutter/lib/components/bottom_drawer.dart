/// 底部抽屉
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:nutritious_meals/components/base_toast.dart';

import '../http/apis.dart';
import '../utils/storage.dart';

class BottomDrawer extends StatefulWidget {
  final Map<String, dynamic> food;
  const BottomDrawer({Key? key, required this.food}) : super(key: key);

  @override
  State<BottomDrawer> createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  int _quantity = 1; // 点餐数量

  // 数量增加
  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  // 数量减少
  void _decrement() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  // 加入购物车
  addCart() async {
    var user = await Storage.readStorage("user");
    // print(user);
    if (user != null && user.isNotEmpty) {
      user = jsonDecode(user);
      var userId = int.parse(user["id"]);

      var res = await Apis.addCar(userId, widget.food["id"], _quantity);
      if (res["code"] == 200) {
        return Fluttertoast.showToast(
            msg: "成功加入购物车",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3, // 显示时间，仅在 iOS 和 Web 平台上生效
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        print("加入购物车失败");
      }
    } else {
      Navigator.pushNamed(context, "/login");
      return BaseToast.failToast("加入购物车失败，请先登录");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 240,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          children: [
            // 食品名称
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        widget.food["foodname"],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Color(0xffffa940),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            // 食堂
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                  padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xff999999), width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: const Text(
                    "午餐",
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                const Text(
                  "知味堂三楼",
                  style: TextStyle(color: Color(0xff8f908f)),
                )
              ],
            ),
            const Divider(
              color: Color(0xfff2f2f2),
            ),
            // 数量
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "数量",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: const Color(0xffdcdfe6))),
                    child: Row(
                      children: [
                        Container(
                          // width: 20,
                          height: 30,
                          decoration: const BoxDecoration(
                              color: Color(0xfff5f7fa),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))),
                          child: IconButton(
                            onPressed: _decrement,
                            icon: const Icon(
                              Icons.remove,
                              size: 14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            '$_quantity',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          // width: 20,
                          height: 30,
                          decoration: const BoxDecoration(
                              color: Color(0xfff5f7fa),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))),
                          child: IconButton(
                            onPressed: _increment,
                            icon: const Icon(
                              Icons.add,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // 加入购物车
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  SizedBox(
                    // margin: ,
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    child: Text(
                      "￥ ${widget.food["price"] * _quantity}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 10,
                    child: ElevatedButton(
                        onPressed: addCart,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff000000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5), // 按钮的边框形状
                          ),
                        ),
                        child: const Text(
                          "加入购物车",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

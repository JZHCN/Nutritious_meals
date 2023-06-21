import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:nutritious_meals/http/apis.dart';

import '../../../utils/storage.dart';

class Buy extends StatefulWidget {
  final int foodId;
  const Buy({Key? key, required this.foodId}) : super(key: key);

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  // 加入购物车
  addCart() async {
    var user = await Storage.readStorage("user");
    // print(user);
    if (user != null && user.isNotEmpty) {
      user = jsonDecode(user);
      var userId = int.parse(user["id"]);
      var res = await Apis.addCar(userId, widget.foodId);
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
    }
  }

  // 立即购买
  void buyNow() async {
    var user = await Storage.readStorage("user");
    if (user != null && user.isNotEmpty) {
      user = jsonDecode(user);
      var userId = int.parse(user["id"]);

      DateTime now = DateTime.now();
      DateTime twoHoursLater = now.add(Duration(hours: 2));
      String nowFormattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      String twoLaterFormattedDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(twoHoursLater);

      var res = await Apis.getFoodById(widget.foodId);
      print(res);
      var res1 = await Apis.addOrder(userId, res["data"]["price"],
          nowFormattedDate, twoLaterFormattedDate);
      if (res1["code"] == 200) {
        List foodList = [res["data"]];
        Map<String, dynamic> data = {
          "foodList": foodList,
          "quantities": [1]
        };
        var res2 = await Apis.addOrderDetail(userId, res1["data"]["id"], data);
        // print(res2);
        if (res2["code"] == 200) {
          var order = res1["data"];
          order["orderdetailList"] = [];
          for (var i = 0; i < foodList.length; i++) {
            order["orderdetailList"].add(foodList[i]);
          }
          // Navigator.pushNamed(context, "order/${res1["data"]["id"]}");
          String jsonString = jsonEncode(order);
          Navigator.of(context).pushNamed("/order", arguments: jsonString);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 15,
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            // padding: const EdgeInsets.symmetric(horizontal: 10),
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
          SizedBox(
            width: MediaQuery.of(context).size.width / 2 - 15,
            // padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ElevatedButton(
                onPressed: buyNow,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff000000),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // 按钮的边框形状
                  ),
                ),
                child: const Text(
                  "立即购买",
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}

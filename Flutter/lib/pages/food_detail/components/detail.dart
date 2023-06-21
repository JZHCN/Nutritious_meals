import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nutritious_meals/components/base_toast.dart';
import 'package:nutritious_meals/pages/food_detail/index.dart';

import '../../../http/apis.dart';
import '../../../utils/storage.dart';

class Detail extends StatefulWidget {
  final Map<String, dynamic> foodDetail;
  const Detail({Key? key, required this.foodDetail}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool isStore = false;

  // 查询商品是否已收藏
  queryIsStore() async {
    var user = await Storage.readStorage("user");
    if (user != null && user.isNotEmpty && widget.foodDetail.isNotEmpty) {
      user = jsonDecode(user);
      var userId = int.parse(user["id"]);
      var res = await Apis.isStore(userId, widget.foodDetail["id"]);
      if (res["code"] == 200) {
        setState(() {
          isStore = res["data"];
        });
      }
    } else {
      print("id为空");
    }
  }

  @override
  void initState() {
    super.initState();
    queryIsStore();
  }

  // 添加/删除收藏
  addStore() async {
    var user = await Storage.readStorage("user");
    // print(user);
    if (user != null && user.isNotEmpty && widget.foodDetail.isNotEmpty) {
      user = jsonDecode(user);
      var userId = int.parse(user["id"]);
      var res = await Apis.addStore(userId, widget.foodDetail["id"]);
      if (res["code"] == 200) {
        setState(() {
          isStore = !isStore;
        });
        print("收藏：$res");
        BaseToast.successToast(res["msg"]);
      }
      // print(storeList[0]);
    } else {
      print("id为空");
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.foodDetail);
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.foodDetail.isNotEmpty
                  ? Text(widget.foodDetail["foodname"],
                      style: const TextStyle(fontSize: 18))
                  : const Text("正在加载...", style: TextStyle(fontSize: 18)),
              widget.foodDetail.isNotEmpty
                  ? Text("￥ ${widget.foodDetail["price"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18))
                  : const Text("￥ 00",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
            ],
          ),
          const Divider(
            color: Color(0xfff2f2f2),
          ),
          widget.foodDetail.isNotEmpty
              ? Text(
                  widget.foodDetail["description"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xff8c8483)),
                )
              : const Text(
                  "正在加载...",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Color(0xff8c8483)),
                ),
          const Divider(
            color: Color(0xfff2f2f2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopify,
                    size: 12,
                    color: Color(0xff8c8483),
                  ),
                  Text(
                    "已售出 88",
                    style: TextStyle(color: Color(0xff8c8483), fontSize: 12),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffffa940)),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: isStore
                    ? GestureDetector(
                        onTap: addStore,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Color(0xffffa940),
                              size: 12,
                            ),
                            Text(
                              "收藏",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )
                    : GestureDetector(
                        onTap: addStore,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: 12,
                            ),
                            Text(
                              "收藏",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      ),
              )
            ],
          )
        ],
      ),
    );
  }
}

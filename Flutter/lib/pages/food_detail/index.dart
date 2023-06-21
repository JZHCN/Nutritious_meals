import 'dart:convert';

import 'package:flutter/material.dart';
import '../../http/apis.dart';
import '../../utils/storage.dart';
import 'components/detail.dart';
import 'components/introduction.dart';
import 'components/comment.dart';
import 'components/buy.dart';

class FoodDetail extends StatefulWidget {
  const FoodDetail({super.key});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  Map<String, dynamic> foodDetail = {}; // 食品详情
  String id = "";

  // 获取食物详情
  Future<void> getFoodDetail() async {
    // 发请求
    var res = await Apis.getFoodById(int.parse(id));
    setState(() {
      foodDetail = res["data"];
    });
    // print(foodDetail);
  }

  // 获取路径参数的食品id
  Future<void> getId() async {
    // 获取路由参数 食品id
    var settings = ModalRoute.of(context)?.settings;
    final uri = Uri.parse(settings?.name ?? '');
    id = uri.pathSegments.length > 1 ? uri.pathSegments[1] : '';

    await getFoodDetail();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getId();
    // getFoodDetail();
  }

  @override
  Widget build(BuildContext context) {
    // getId();
    // getFoodDetail();

    return Scaffold(
      appBar: AppBar(
        title: const Text("菜品详情"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // 获取当前屏幕高度
        color: const Color(0xfff7f8f7),
        child: Stack(
          children: [
            Positioned(
              child: foodDetail["img"] != null
                  ? Image.network(
                      foodDetail["img"],
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "assets/images/food1.png",
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              bottom: 50,
              child: ListView(
                children: [
                  foodDetail.isNotEmpty
                      ? Detail(
                          foodDetail: foodDetail,
                        )
                      : const Text("正在加载..."),
                  // Detail(
                  //   foodDetail: foodDetail,
                  // ),
                  foodDetail.isNotEmpty
                      ? Comment(id: foodDetail["id"])
                      : const Text("正在加载..."),

                  foodDetail.isNotEmpty
                      ? Introduction(
                          foodDetail: foodDetail,
                        )
                      : const Text("正在加载..."),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10,
              child: foodDetail.isNotEmpty
                  ? Buy(
                      foodId: foodDetail["id"],
                    )
                  : const Text("正在加载..."),
            )
          ],
        ),
      ),
    );
  }
}

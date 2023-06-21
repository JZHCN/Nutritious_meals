import 'package:flutter/material.dart';

class PickUpMeals extends StatefulWidget {
  const PickUpMeals({super.key});

  @override
  State<PickUpMeals> createState() => _PickUpMealsState();
}

class _PickUpMealsState extends State<PickUpMeals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("取餐点"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height, // 获取当前屏幕高度
        color: const Color(0xfff7f8f7),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "知味堂三楼食堂窗口",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: const Color(0xffe0f7e1),
                        ),
                        child: const Text(
                          "开放中",
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("工作时间 11:00 - 20:00"),
                        Icon(
                          Icons.favorite,
                          color: Color(0xffFFA940),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

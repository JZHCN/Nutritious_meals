import 'package:flutter/material.dart';

class Consumption extends StatefulWidget {
  const Consumption({super.key});

  @override
  State<Consumption> createState() => _ConsumptionState();
}

class _ConsumptionState extends State<Consumption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("消费点"),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "知味堂三楼",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Color(0xffFFA940),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff999999),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: const Text(
                                    "早餐",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff999999),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: const Text(
                                    "午餐",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff999999),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: const Text(
                                    "晚餐",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                            const Text("已售出 88328")
                          ],
                        ),
                      ),
                      const Text("工作时间 07:00 - 22:00")
                    ]),
              )
            ],
          ),
        ));
  }
}

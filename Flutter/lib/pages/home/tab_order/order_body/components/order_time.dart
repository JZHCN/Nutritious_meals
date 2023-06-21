import 'package:flutter/material.dart';

class OrderTime extends StatefulWidget {
  const OrderTime({Key? key}) : super(key: key);

  @override
  State<OrderTime> createState() => _OrderTimeState();
}

class _OrderTimeState extends State<OrderTime>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // 导航栏控制器

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 3, 0, 10),
        child: Column(children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,   // 选中标签的颜色
              indicatorColor: Colors.black, // 指示器颜色
              tabs: const [
                Tab(

                  child: Text(
                      "早餐",  style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ),
                Tab(
                  child: Text(
                    "午餐",  style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ),
                Tab(
                  child: Text(
                    "晚餐",  style: TextStyle(fontWeight: FontWeight.bold)
                  )
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 30,
            color: Colors.white,
            child: TabBarView(
              controller: _tabController,
              children: [
                Row(
                  children: [
                    const Text(
                        "早餐供应时间7:00-10:00",
                        style: TextStyle(fontSize: 12, color: Color(0xff919291))
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xff64a66a),
                          width: 1
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      child: const Text(
                          "供应中",
                          style: TextStyle(fontSize: 10, color: Color(0xff64a66a))
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text(
                        "午餐供应时间11:00-15:00",
                        style: TextStyle(fontSize: 12, color: Color(0xff919291))
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff64a66a),
                              width: 1
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      child: const Text(
                          "供应中",
                          style: TextStyle(fontSize: 10, color: Color(0xff64a66a))
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Text(
                        "晚餐供应时间16:00-23:00",
                        style: TextStyle(fontSize: 12, color: Color(0xff919291))
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color(0xff64a66a),
                              width: 1
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      child: const Text(
                          "供应中",
                          style: TextStyle(fontSize: 10, color: Color(0xff64a66a))
                      ),
                    )
                  ],
                ),
            ]),
          )
        ]));
  }
}

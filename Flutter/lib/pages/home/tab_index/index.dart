import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../http/apis.dart';
import '../../../utils/storage.dart';
import '../../food_detail/index.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class TabIndex extends StatefulWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabIndexState();
}

class _TabIndexState extends State<StatefulWidget> {
  List<dynamic> recommendList = [];
  double screenWidth = 0; // 获取屏幕宽度
  double _top = 230; // 内容盒子定位的top值
  int _currentPage = 0; // PageView的当前page
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true, // 保存加载的每个页面的状态
  ); // 控制PageView的滚动

  // 更新 _top 的函数
  void updateTop(details) {
    setState(() {
      _top += details.delta.dy;
      if (_top <= 50) {
        _top = 50;
      }
      if (_top >= 230) {
        _top = 230;
      }
    });
  }

  // 改变PageView的当前page
  changeCurrentPage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  final List<String> _imageUrls = [
    // 特色菜品图片
    'assets/images/special_food.png',
    'assets/images/special_food.png',
    'assets/images/special_food.png',
  ];

  // 获取推荐食物
  getRecommend() async {
    // 获取用户id
    var user = await Storage.readStorage("user");
    // print(user);
    if (user != null && user.isNotEmpty) {
      user = jsonDecode(user);
      var id = int.parse(user["id"]);
      var res = await Apis.recommendForUser(id);
      if (res["code"] == 200) {
        setState(() {
          recommendList = res["data"];
        });
      }
      // print(storeList[0]);
    } else {
      var res = await Apis.recommend();
      if (res["code"] == 200) {
        setState(() {
          recommendList = res["data"];
        });
      }
    }

    print(recommendList);
  }

  @override
  void initState() {
    super.initState();
    getRecommend();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      // 监听手指滑动事件
      onPanUpdate: updateTop,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 350,
            child: Image.asset(
              "assets/images/bg.png",
              fit: BoxFit.cover,
            ),
          ),
          const Positioned(
            top: 15,
            left: 20,
            child: Text(
              "您好，欢迎光临！",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: _top,
            left: 0,
            right: 0,
            bottom: 0,
            child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 600,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xfff7f8f7),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      border:
                          Border.all(color: const Color(0xfff7f8f7), width: 2),
                      boxShadow: []),
                  padding: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/consumption");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/iconPark-map-distance.png",
                                        width: 60,
                                        height: 80,
                                      ),
                                      const Text("超多消费点"),
                                      const Icon(
                                        Icons.arrow_right,
                                        color: Color(0xFFC6C6C6),
                                      )
                                    ],
                                  ),
                                ),
                                // 华丽的分割线 竖线
                                Container(
                                  color: Colors.grey[300],
                                  height: 50,
                                  width: 1,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "/pickup");
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/images/iconPark-map-distance.png",
                                        width: 60,
                                        height: 80,
                                      ),
                                      const Text("取餐点查询"),
                                      const Icon(
                                        Icons.arrow_right,
                                        color: Color(0xFFC6C6C6),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset("assets/images/order1.png"),
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              children: [
                                                const Text("早餐"),
                                                Container(
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          2, 0, 2, 0),
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          1, 0, 1, 0),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xff7bc833),
                                                        width: 1),
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                20)),
                                                    color:
                                                        const Color(0xffe9f9ea),
                                                  ),
                                                  child: const Text(
                                                    "可取餐",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color:
                                                            Color(0xff7bc833)),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3),
                                            child: Text(
                                              "取餐码：9527",
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey[700]),
                                            )),
                                        Text(
                                          "取餐点：女生宿舍区L5一楼103",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // 华丽的分割线 竖线
                                  Container(
                                    color: Colors.grey[300],
                                    height: 50,
                                    width: 1,
                                    // child: Text("data"),
                                  ),
                                  Column(
                                    children: [
                                      Image.asset("assets/images/barcode.png"),
                                      Text(
                                        "取餐条码",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[700]),
                                      )
                                    ],
                                  ),
                                ],
                              )),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                            child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("校园食堂介绍"),
                                  Text(
                                    "第一食堂位于德阳校区南区办公楼右侧，分为1楼和2楼，可同时容纳500人就餐，设有家常菜窗口、小炒窗口、凉菜窗口等。营业时间为6：30~21：00，其中特色菜...",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 10, color: Color(0xff989998)),
                                  ),
                                ]),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              ),
                              // height: 300,
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "特色菜品",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Text(
                                            "${_currentPage + 1}/${recommendList.length}",
                                            style:
                                                const TextStyle(fontSize: 20))
                                      ]),
                                  SizedBox(
                                    height: 260,
                                    child: PageView.builder(
                                        controller: _pageController,
                                        itemCount: recommendList.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.pushNamed(context,
                                                  "/detail/${recommendList[index]['id']}");
                                            },
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 10, 10, 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        recommendList[index]
                                                            ['img'],
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width -
                                                            50,
                                                        height: 200,
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ),
                                                    Text(
                                                      recommendList[index]
                                                          ['foodname'],
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                    Text(
                                                      "￥ ${recommendList[index]['price']}",
                                                      style: TextStyle(
                                                          fontSize: 14),
                                                    ),
                                                  ],
                                                )),
                                          );
                                        },
                                        onPageChanged: changeCurrentPage),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

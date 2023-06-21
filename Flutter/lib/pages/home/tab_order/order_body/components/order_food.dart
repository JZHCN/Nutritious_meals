import 'package:flutter/material.dart';
import 'package:nutritious_meals/http/apis.dart';
import '../../../../../components/bottom_drawer.dart';

class OrderFood extends StatefulWidget {
  const OrderFood({Key? key}) : super(key: key);

  @override
  State<OrderFood> createState() => _OrderFoodState();
}

class _OrderFoodState extends State<OrderFood> {
  final PageController _pageController = PageController(); // 侧边导航栏控制器
  int _currentPageIndex = 0; // 当前导航索引
  List<dynamic> allFood = []; // 所有食物

  // 查询所有食物
  getAllFood() async {
    var res = await Apis.getAllFood();
    if (res["code"] == 200) {
      setState(() {
        allFood = res["data"];
      });
      // print(allFood);
    } else {
      print("查询失败");
    }
  }

  getNutritiousFoodByType(int index) {
    return allFood.where((element) => element["nutritype"] == index).toList();
  }

  @override
  void initState() {
    super.initState();
    getAllFood();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Drawer(
              width: 120,
              child: ListView(
                children: [
                  ListTile(
                    title: const Text("全部",
                        style:
                            TextStyle(color: Color(0xff909090), fontSize: 14)),
                    onTap: () {
                      _pageController.jumpToPage(0);
                      setState(() {
                        _currentPageIndex = 0;
                      });
                    },
                    selected: _currentPageIndex == 0,
                    selectedTileColor: Colors.white,
                  ),
                  ListTile(
                    title: const Text("补充蛋白质",
                        style:
                            TextStyle(color: Color(0xff909090), fontSize: 14)),
                    onTap: () {
                      _pageController.jumpToPage(1);
                      setState(() {
                        _currentPageIndex = 1;
                      });
                    },
                    selected: _currentPageIndex == 1,
                    selectedTileColor: Colors.white,
                  ),
                  ListTile(
                    title: const Text("减脂",
                        style:
                            TextStyle(color: Color(0xff909090), fontSize: 14)),
                    onTap: () {
                      _pageController.jumpToPage(2);
                      setState(() {
                        _currentPageIndex = 2;
                      });
                    },
                    selected: _currentPageIndex == 2,
                    selectedTileColor: Colors.white,
                  ),
                  ListTile(
                    title: const Text("补充维生素",
                        style:
                            TextStyle(color: Color(0xff909090), fontSize: 14)),
                    onTap: () {
                      _pageController.jumpToPage(3);
                      setState(() {
                        _currentPageIndex = 3;
                      });
                    },
                    selected: _currentPageIndex == 3,
                    selectedTileColor: Colors.white,
                  ),
                  ListTile(
                    title: const Text("补充矿物质",
                        style:
                            TextStyle(color: Color(0xff909090), fontSize: 14)),
                    onTap: () {
                      _pageController.jumpToPage(4);
                      setState(() {
                        _currentPageIndex = 4;
                      });
                    },
                    selected: _currentPageIndex == 4,
                    selectedTileColor: Colors.white,
                  ),
                  ListTile(
                    title: const Text("低GI",
                        style:
                            TextStyle(color: Color(0xff909090), fontSize: 14)),
                    onTap: () {
                      _pageController.jumpToPage(5);
                      setState(() {
                        _currentPageIndex = 5;
                      });
                    },
                    selected: _currentPageIndex == 5,
                    selectedTileColor: Colors.white,
                  ),
                ],
              )),
          Expanded(
            child: Container(
                color: Colors.white,
                child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    children: List.generate(6, (index) {
                      if (index == 0) {
                        // 全部
                        return Container(
                            padding: const EdgeInsets.only(right: 5),
                            child: ListView.builder(
                              itemCount: allFood.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // 照片
                                    Container(
                                        width: 85,
                                        height: 75,
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 5, 10, 5),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            allFood[index]["img"],
                                            fit: BoxFit.fill,
                                          ),
                                        )),
                                    // 内容
                                    Expanded(
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                "/detail/${allFood[index]["id"]}");
                                          },
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 5),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  allFood[index]["foodname"],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  allFood[index]["description"],
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                      color: Color(0xff979797),
                                                      fontSize: 10),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "￥ ${allFood[index]["price"].toString()}",
                                                        style: const TextStyle(
                                                            fontSize: 12),
                                                      ),
                                                      IconButton(
                                                        alignment:
                                                            Alignment.center,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
                                                        icon: const Icon(Icons
                                                            .add_circle_outline),
                                                        iconSize: 14,
                                                        color: const Color(
                                                            0xff101010),
                                                        onPressed: () {
                                                          // 点击展示加入购物车
                                                          showModalBottomSheet(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return BottomDrawer(
                                                                food: allFood[
                                                                    index],
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )),
                                    )
                                  ],
                                );
                              },
                            ));
                      } else {
                        // 分类结果
                        return Container(
                            padding: const EdgeInsets.only(right: 5),
                            child: ListView.builder(
                              itemCount: getNutritiousFoodByType(index).length,
                              itemBuilder: (context, i) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 85,
                                      height: 75,
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 5, 10, 5),
                                      child: Image.network(
                                        getNutritiousFoodByType(index)[i]
                                            ["img"],
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    Expanded(
                                        child: Container(
                                      margin: const EdgeInsets.only(top: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            getNutritiousFoodByType(index)[i]
                                                ["foodname"],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                          Text(
                                            getNutritiousFoodByType(index)[i]
                                                ["description"],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Color(0xff979797),
                                                fontSize: 10),
                                          ),
                                          SizedBox(
                                            height: 20,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "￥ ${getNutritiousFoodByType(index)[i]["price"].toString()}",
                                                  style: const TextStyle(
                                                      fontSize: 12),
                                                ),
                                                IconButton(
                                                  alignment: Alignment.center,
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  icon: const Icon(
                                                      Icons.add_circle_outline),
                                                  iconSize: 14,
                                                  color:
                                                      const Color(0xff101010),
                                                  onPressed: () {
                                                    // 点击展示加入购物车
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (BuildContext
                                                          context) {
                                                        return BottomDrawer(
                                                          food:
                                                              getNutritiousFoodByType(
                                                                  index)[i],
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                                  ],
                                );
                              },
                            ));
                      }
                    }))),
          ),
        ],
      ),
    );
  }
}

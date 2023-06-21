import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:nutritious_meals/components/base_toast.dart';
import '../../../../components/quantity_picker.dart';
import '../../../../http/apis.dart';
import '../../../../store/car_store.dart';
import '../../../../utils/storage.dart';
import 'components/my_order.dart';
import 'components/go_pay.dart';

class CarBody extends StatefulWidget {
  const CarBody({super.key});

  @override
  State<CarBody> createState() => _CarBodyState();
}

class _CarBodyState extends State<CarBody> {
  List<dynamic> carList = []; // 购物车数据
  List<dynamic> foodList = []; // 食物详情数据

  CarStore carStore = CarStore();
  // 获取购物车数据和食物详情数据
  getData() async {
    // 获取用户id
    var user = await Storage.readStorage("user");
    // print(user);
    if (user != null && user.isNotEmpty) {
      user = jsonDecode(user);
      var id = int.parse(user["id"]);

      // if (carStore.carList.isEmpty) {
      carStore.getCarAsync(id);
      // }
      // var res1;
      var res2 = await Apis.getCarFood(id);
      setState(() {
        carList = carStore.carList;
        foodList = res2["data"];
      });
      // print("===================");
      // print(carList);
      // print(foodList);

      // 改变选中状态
      if (carStore.isSelected.isEmpty) {
        for (var i = 0; i < carList.length; i++) {
          carStore.isSelected.add(false);
        }
      } else {
        carStore.isSelected = [];
        for (var i = 0; i < carList.length; i++) {
          carStore.isSelected.add(false);
        }
      }
      // print(carStore.isSelected);
    } else {
      BaseToast.failToast("请先登录");
      toLogin();
    }
  }

  toLogin() {
    Navigator.pushNamed(context, "/login");
  }

  // 子组件QuantityPicker的数量
  setPickerNum(value, index) {
    carStore.setTotal(value, index);
  }

  // 去结算
  void toPay() async {
    var user = await Storage.readStorage("user");
    print(user);
    if (user != null && user.isNotEmpty) {
      user = jsonDecode(user);
      var userId = int.parse(user["id"]);

      DateTime now = DateTime.now();
      DateTime twoHoursLater = now.add(Duration(hours: 2));
      String nowFormattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
      String twoLaterFormattedDate =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(twoHoursLater);
      var res1 = await Apis.addOrder(
          userId, carStore.resTotal, nowFormattedDate, twoLaterFormattedDate);
      if (res1["code"] == 200) {
        List quantities = [];
        for (var i = 0; i < foodList.length; i++) {
          quantities.add(1);
        }
        Map<String, dynamic> data = {
          "foodList": foodList,
          "quantities": quantities
        };
        var res2 = await Apis.addOrderDetail(userId, res1["data"]["id"], data);
        print(res2);
        // if (res2["code"] == 200) {
          var order = res1["data"];
          order["orderdetailList"] = [];
          for (var i = 0; i < foodList.length; i++) {
            order["orderdetailList"].add(foodList[i]);
          }
          // Navigator.pushNamed(context, "order/${res1["data"]["id"]}");
          String jsonString = jsonEncode(order);
          Navigator.of(context).pushNamed("/order", arguments: jsonString);
        // }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xfff7f8f7),
        child: Stack(
          children: [
            // 订单食品信息
            SizedBox(

              height: 495,
              child: ListView(
                children: [
                  // MyOrder()
                  Observer(
                      builder: (_) => Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 食堂名称
                                Container(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    margin: const EdgeInsets.only(top: 10),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          value: carStore.isSelectedAll,
                                          onChanged: carStore.changeSelectedAll,
                                          shape: const CircleBorder(),
                                          activeColor: const Color(0xff101010),
                                        ),
                                        const Text(
                                          "食堂一栋东区天天饮食",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    )),
                                // 点菜详情
                                Column(
                                    children: List.generate(
                                  carStore.isSelected.length,
                                  (index) => Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 10, 10, 10),
                                    // width: 500,
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Color(0xfff4f4f4),
                                                width: 1))),
                                    child: SizedBox(
                                      width: 500,
                                      child: Row(
                                        children: [
                                          // 复选框
                                          Checkbox(
                                            value: carStore.isSelected[index],
                                            onChanged: (value) {
                                              if (value == true) {
                                                setState(() {
                                                  carStore.isSelected[index] =
                                                  value!;
                                                  carStore.isSelectedAll =
                                                      carStore.isSelected.every(
                                                              (element) => value);
                                                });
                                              } else {
                                                carStore.setTotal(0, index);
                                                setState(() {
                                                  carStore.isSelected[index] =
                                                  value!;
                                                  carStore.isSelectedAll =
                                                      carStore.isSelected.every(
                                                              (element) => value);
                                                });
                                              }
                                            },
                                            shape: const CircleBorder(),
                                            activeColor: const Color(0xff101010),
                                          ),
                                          // 图片
                                          Image.network(
                                            foodList[index]["img"],
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.cover,
                                          ),
                                          // 内容
                                          Container(
                                            margin:
                                            const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                // 菜名
                                                Row(
                                                  children: [
                                                    Text(
                                                      foodList[index]["foodname"],
                                                      style: const TextStyle(
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                    Container(
                                                        margin: const EdgeInsets
                                                            .fromLTRB(2, 0, 2, 0),
                                                        padding: const EdgeInsets
                                                            .fromLTRB(2, 0, 2, 0),
                                                        decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xff999999),
                                                              width: 1),
                                                          borderRadius:
                                                          const BorderRadius
                                                              .all(
                                                              Radius.circular(
                                                                  20)),
                                                          color: Colors.white,
                                                        ),
                                                        child: const Text(
                                                          "午餐",
                                                          style: TextStyle(
                                                              fontSize:
                                                              10),
                                                        )
                                                            ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 220,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "￥ ${foodList[index]["price"]}",
                                                        // style: TextStyle(fontWeight: FontWeight.bold),
                                                      ),
                                                      // 数量选择
                                                      QuantityPicker(
                                                        setQuantity: setPickerNum,
                                                        index: index,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ),
                                ))
                              ],
                            ),
                          ))
                ],
              ),
            ),
            // 底部订单信息
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Observer(
                    builder: (_) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: carStore.isSelectedAll,
                                  onChanged: carStore.changeSelectedAll,
                                  shape: const CircleBorder(),
                                  activeColor: const Color(0xff101010),
                                ),
                                const Text("全选"),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    children: [
                                      const Text("合计：￥",
                                          style: TextStyle(fontSize: 12)),
                                      Text(
                                        carStore.resTotal.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 130,
                                  height: 50,
                                  color: const Color(0xff454545),
                                  child: TextButton(
                                      onPressed: toPay,
                                      child: const Text("支付",
                                          style:
                                              TextStyle(color: Colors.white))),
                                )
                              ],
                            )
                          ],
                        )),
              ),
            )
          ],
        ));
  }
}

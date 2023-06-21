import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:nutritious_meals/store/car_store.dart';
import '../../../../../components/base_toast.dart';
import '../../../../../components/quantity_picker.dart';
import '../../../../../http/apis.dart';
import '../../../../../utils/storage.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
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
  void toPay() {
    Navigator.pushNamed(context, "order/1");
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
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
                            onChanged: (value) {
                              setState(() {
                                carStore.isSelectedAll = value!;
                                carStore.isSelected = List.filled(
                                    carStore.isSelected.length, value);
                              });
                            },
                            shape: const CircleBorder(),
                            activeColor: const Color(0xff101010),
                          ),
                          const Text(
                            "食堂一栋东区天天饮食",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      )),
                  // 点菜详情
                  Column(
                      children: List.generate(
                    carStore.isSelected.length,
                    (index) => Container(
                      padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      // width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Color(0xfff4f4f4), width: 1))),
                      child: Row(
                        children: [
                          // 复选框
                          Checkbox(
                            value: carStore.isSelected[index],
                            onChanged: (value) {
                              setState(() {
                                carStore.isSelected[index] = value!;
                                carStore.isSelectedAll = carStore.isSelected
                                    .every((element) => value);
                              });
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
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // 菜名
                                Row(
                                  children: [
                                    Text(
                                      foodList[index]["foodname"],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            2, 0, 2, 0),
                                        padding: const EdgeInsets.fromLTRB(
                                            2, 0, 2, 0),
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
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  )
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 220,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                    ),
                  ))
                ],
              ),
            ));
  }
}

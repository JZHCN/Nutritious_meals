import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../../http/apis.dart';
import '../../../../../store/car_store.dart';
import '../../../../../utils/storage.dart';

class GoPay extends StatefulWidget {
  const GoPay({Key? key}) : super(key: key);

  @override
  State<GoPay> createState() => _GoPayState();
}

class _GoPayState extends State<GoPay> {
  CarStore carStore = CarStore();

  // 去结算
  void toPay() {
    Navigator.pushNamed(context, "order/1");
  }

  @override
  Widget build(BuildContext context) {
    // print("111${carStore.isSelectedAll}");
    return Observer(
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
                          const Text("合计：￥", style: TextStyle(fontSize: 12)),
                          Text(
                            carStore.resTotal.toString(),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                              style: TextStyle(color: Colors.white))),
                    )
                  ],
                )
              ],
            ));
  }
}

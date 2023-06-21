import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nutritious_meals/http/apis.dart';

// 每次更新运行：dart run build_runner build
part 'car_store.g.dart';

class CarStore = CarStoreBase with _$CarStore;

abstract class CarStoreBase with Store {
  @observable
  List<dynamic> carList = []; // 购物车列表
  @observable
  List<bool> isSelected = []; // 是否选中
  @observable
  bool isSelectedAll = false; // 是否全选
  @observable
  List<double> total = []; // 每一项总价
  @observable
  double resTotal = 0; // 最终总价

  @action
  Future<void> getCarAsync(int id) async {
    var res = await Apis.getCar(id);
    // print(res);
    if (res["code"] == 200) {
      carList = res["data"];

      for (var i = 0; i < carList.length; i++) {
        total.add(0);
      }
    }
  }

  @action
  changeSelectedAll(value) {
    isSelectedAll = value!;
    if (isSelectedAll) {
      isSelected = List.filled(isSelected.length, true);
      for (var i = 0; i < carList.length; i++) {
        setTotal(1, i);
      }
    } else {
      isSelected = List.filled(isSelected.length, false);
      resTotal = 0;
    }
    // for (var i = 0; i < carList.length; i++) {
    //   setTotal(1, i);
    // }
  }

  @action
  setTotal(int quantity, int index) async {
    if (carList.isNotEmpty && isSelected[index]) {
      // total = total + quantity * int.parse(carList[index]["price"]);
      var id = carList[index]["foodid"];
      var res = await Apis.getFoodById(id);
      var price = res["data"]["price"];

      total[index] = (quantity * price).toDouble();
    }
    resTotal = 0;
    for (var i = 0; i < total.length; i++) {
      resTotal += total[i];
    }
    // print(resTotal);
  }
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BaseToast {
  static successToast(String msg) {
    // 提示操作结果 使用第三方组件
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    // return ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(msg),
    //     duration: const Duration(seconds: 3),
    //     behavior: SnackBarBehavior.floating,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10),
    //     ),
    //     margin: const EdgeInsets.all(20),
    //     elevation: 4,
    //     backgroundColor: Colors.green,
    //     action: SnackBarAction(
    //       label: '关闭',
    //       textColor: Colors.white,
    //       onPressed: () {
    //         Navigator.pushNamed(context, "/");
    //       },
    //     ),
    //   ),
    // );
  }

  static failToast(String msg) {
    // 提示操作结果 使用第三方组件
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}

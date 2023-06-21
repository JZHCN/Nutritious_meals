import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../components/base_toast.dart';
import '../../../http/apis.dart';

class Payment extends StatefulWidget {
  final Map<String, dynamic> orderDetail;
  const Payment({Key? key, required this.orderDetail}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  // 支付
  pay() async {
    var res = await Apis.changeOrderType(
        widget.orderDetail["id"], widget.orderDetail["type"] + 1);
    if (res["code"] == 200) {
      BaseToast.successToast("支付成功");
      // 支付成功，返回首页
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, "/");
      });
    } else {
      BaseToast.failToast("失败！");
    }

    // 提示操作结果
    // return ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: const Text('支付成功'),
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

    // 提示操作结果 使用第三方组件
    // return Fluttertoast.showToast(
    //   msg: '支付成功',
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.CENTER,
    //   timeInSecForIosWeb: 3,
    //   backgroundColor: Colors.green,
    //   textColor: Colors.white,
    //   fontSize: 16.0,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      // padding: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Row(
              children: [
                const Text("合计：￥", style: TextStyle(fontSize: 12)),
                Text(
                  "${widget.orderDetail["totalprice"]}",
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
                onPressed: pay,
                child: const Text("支付", style: TextStyle(color: Colors.white))),
          )
        ],
      ),
    );
  }
}

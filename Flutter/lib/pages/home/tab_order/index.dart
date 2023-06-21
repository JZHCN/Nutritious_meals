import 'package:flutter/material.dart';
import 'order_body/index.dart';

class TabCategory extends StatelessWidget {
  const TabCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("点餐"),
        ),
        backgroundColor: Colors.white,
      ),
      body: const OrderBody(),
    );
  }
}
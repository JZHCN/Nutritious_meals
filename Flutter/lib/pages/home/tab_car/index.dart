import 'package:flutter/material.dart';
import 'car_body/index.dart';

class TabCar extends StatelessWidget {
  const TabCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("购物车"),
        ),
        backgroundColor: Colors.white,
      ),
      body: const CarBody(),
    );
  }
}

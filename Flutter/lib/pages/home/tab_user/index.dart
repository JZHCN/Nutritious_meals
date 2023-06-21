import 'package:flutter/material.dart';
import 'user_body/index.dart';

class TabUser extends StatelessWidget {
  const TabUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("我的"),
        ),
        backgroundColor: Colors.white,
      ),
      body: const UserBody(),
    );
  }
}

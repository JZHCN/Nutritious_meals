import 'package:flutter/material.dart';
import 'dart:async';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed("/");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/loading.jpg', fit: BoxFit.cover);
  }
}
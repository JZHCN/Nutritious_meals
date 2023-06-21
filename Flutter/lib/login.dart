import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nutritious_meals/http/apis.dart';
import 'package:nutritious_meals/model/User.dart';
import 'pages/home/tab_user/index.dart';
import 'package:nutritious_meals/utils/storage.dart';
import 'register.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  late Map<String, dynamic> userInfo;

  // 释放资源和清理对象，防止内存泄漏
  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("登录"),
        ),
        body: (Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        labelText: "电话号码", hintText: "请输入你的手机号码"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "手机号不能为空";
                      }
                      if (!RegExp(r"^1\d{10}$").hasMatch(value)) {
                        return "电话号码格式不正确";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "密码",
                      hintText: "请输入至少6位的密码",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "密码不能为空";
                      }
                      if (value.length < 6) {
                        return "请输入至少6位的密码";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String phone = _phoneController.text;
                            String password = _passwordController.text;

                            print("电话号码：$phone");
                            print("密码：$password");

                            var data =
                                User(phonenumber: phone, password: password);
                            Apis.login(data.toMap()).then((value) => {
                                  if (value["code"] == 200)
                                    {
                                      // jsonEncode 将Map转化为字符串
                                      Storage.saveStorage(
                                          "user", jsonEncode(value["data"])),
                                      Navigator.pushReplacementNamed(
                                          context, "/"),
                                      print("结果：${value["data"]}")
                                    }
                                  else
                                    {
                                      Fluttertoast.showToast(
                                          msg: "电话号码或密码错误!",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 3,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16),
                                    }
                                });
                          }
                        },
                        child: const Text("登录")),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()));
                      },
                      child: const Text(
                        "没有账号，去注册",
                        style: TextStyle(fontSize: 12),
                      )),
                ],
              ),
            ))));
  }
}

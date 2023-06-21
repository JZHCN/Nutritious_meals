import 'package:flutter/material.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // 释放资源和清理对象，防止内存泄漏
  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("注册"),
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
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "确认密码",
                      hintText: "确认密码",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "密码不能为空";
                      }
                      if (value != _passwordController.text) {
                        return "请输入正确的密码";
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
                            String confirmPassword =
                                _confirmPasswordController.text;

                            print("$phone");
                            print("$password");
                            print("$confirmPassword");

                            Navigator.pop(context);
                          }
                        },
                        child: const Text("注册")),
                  ),
                ],
              ),
            ))));
  }
}

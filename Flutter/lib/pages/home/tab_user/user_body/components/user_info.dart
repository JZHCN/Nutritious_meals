import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:nutritious_meals/utils/storage.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _isLogin = false; // 是否已登录
  Map<String, dynamic> userInfo = {}; // 用户信息

  @override
  void initState() {
    super.initState();
    userLogin();
  }

  // 获取用户登录信息
  void userLogin() async {
    var user = await Storage.readStorage("user");
    if (user != null) {
      userInfo = jsonDecode(user);
      // print("用户信息：$userInfo");

      if (userInfo.isNotEmpty) {
        setState(() {
          _isLogin = true;
        });
      }
    }

    print("用户是否已登录：$_isLogin");
  }

  @override
  Widget build(BuildContext context) {
    // userLogin();
    return _isLogin
        ? Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/海贼王.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "${userInfo['username']}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: const Color(0xff2c386a),
                              borderRadius: BorderRadius.circular(5)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.person_4,
                                color: Color(0xff949FCA),
                              ),
                              Text(
                                "学生",
                                style: TextStyle(color: Color(0xff949FCA)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text("${userInfo['phonenumber']}"),
                  ]),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, "login");
                    Storage.deleteStorage("user");
                    setState(() {
                      _isLogin = false;
                      userInfo = {};
                    });
                  },
                  child: const Text("登出"))
            ],
          )
        : Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "login");
                },
                child: const Text("登录")));
  }
}

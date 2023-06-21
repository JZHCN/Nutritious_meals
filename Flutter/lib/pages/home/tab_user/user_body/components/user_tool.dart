import 'package:flutter/material.dart';

class UserTool extends StatefulWidget {
  const UserTool({Key? key}) : super(key: key);

  @override
  State<UserTool> createState() => _UserToolState();
}

class _UserToolState extends State<UserTool> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: const Text(
            "工具",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 3),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: 20,
                    height: 20,
                    color: const Color(0xffffffff),
                    child: const Icon(
                      Icons.settings,
                      size: 15,
                    ),
                  ),
                  const Text(
                    "投诉建议",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xff919291),
              ),
            ],
          ),
        )
      ],
    );
  }
}

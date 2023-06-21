import 'package:flutter/material.dart';

class PickUpMeals extends StatefulWidget {
  const PickUpMeals({Key? key}) : super(key: key);

  @override
  State<PickUpMeals> createState() => _PickUpMealsState();
}

class _PickUpMealsState extends State<PickUpMeals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "到店取餐",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            )
          ),
          Row(
            children: [
              Text(
                "切换取餐点",
                style: TextStyle(
                  color: Color(0xff333333),
                  fontSize: 12
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Color(0xff333333),
                size: 12,
              )
            ],
          )
        ],
      ),
    );
  }
}

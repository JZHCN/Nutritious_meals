import 'package:flutter/material.dart';

class IdCart extends StatefulWidget {
  const IdCart({Key? key}) : super(key: key);

  @override
  State<IdCart> createState() => _IdCartState();
}

class _IdCartState extends State<IdCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
          color: Color(0xff2c386a),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(

            children: [
              const Text(
                "一卡通",
                style: TextStyle(color: Color(0xffFCD2AF)),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: const Color(0xffcdaf96),
                height: 16,
                width: 1,
              ),
              const Text("当前余额￥389.00",style: TextStyle(color: Color(0xffcdaf96)),),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(8,2,3,5),
            decoration: BoxDecoration(
              color: const Color(0xffFCD2AF),
              borderRadius: BorderRadius.circular(20)
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("立即查看",style: TextStyle(fontSize: 12, color: Color(0xff8A5F32)),),
                Icon(Icons.keyboard_arrow_right, size: 12,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

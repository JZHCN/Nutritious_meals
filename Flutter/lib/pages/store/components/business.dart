import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nutritious_meals/http/apis.dart';
import 'package:nutritious_meals/utils/storage.dart';

class Business extends StatefulWidget {
  final Map food;
  const Business({Key? key, required this.food}) : super(key: key);

  @override
  State<Business> createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    // print(widget.food["id"]);
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/detail/${widget.food["id"]}");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        widget.food["img"],
                        width: 70,
                        height: 70,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.food["foodname"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xff999999), width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  color: Colors.white,
                                ),
                                child: const Text(
                                  "午餐",
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 240,
                            child: Text(
                              widget.food["description"],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xff999999)),
                            ),
                          ),
                          Text(
                            "￥ ${widget.food["price"].toString()}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: const Row(
                    children: [
                      Icon(Icons.storefront,
                          size: 16, color: Color(0xff999999)),
                      Text("知味堂三楼",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xff999999)))
                    ],
                  ),
                )
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     const Text("￥ 2.00", style: TextStyle(fontWeight: FontWeight.bold),),
                //     Text("x 1", style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                //     )
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }
}

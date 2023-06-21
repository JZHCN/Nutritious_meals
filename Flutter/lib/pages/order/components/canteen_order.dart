import 'package:flutter/material.dart';

class CanteenOrder extends StatefulWidget {
  final List<dynamic> foodList;
  const CanteenOrder({Key? key, required this.foodList}) : super(key: key);

  @override
  State<CanteenOrder> createState() => _CanteenOrderState();
}

class _CanteenOrderState extends State<CanteenOrder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print("@@@${widget.foodList}");
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "知味堂三楼",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          ...List.generate(widget.foodList.length, (index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: const BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Color(0xfff4f4f4), width: 1))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          widget.foodList[index]["img"],
                          width: 70,
                          height: 65,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.foodList[index]["foodname"],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                                  padding:
                                      const EdgeInsets.fromLTRB(1, 0, 1, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff999999),
                                        width: 1),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: Text(
                                    "午餐",
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.foodList[index]["description"],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 12, color: Color(0xff999999)),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "￥ ${widget.foodList[index]["price"]}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "x ${widget.foodList[index]['quantity'] != null ? widget.foodList[index]["quantity"] : 1}",
                        style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                      )
                    ],
                  ),
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

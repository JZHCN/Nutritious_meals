import 'package:flutter/material.dart';

import '../../../components/text_divider.dart';

class Introduction extends StatefulWidget {
  final Map<String, dynamic> foodDetail;
  const Introduction({Key? key, required this.foodDetail}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  @override
  Widget build(BuildContext context) {
    print(widget.foodDetail);
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          const TextDivider(
            text: "商品介绍",
          ),
          Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              // height: 300,
              child: Table(
                border: TableBorder.all(),
                children: [
                  const TableRow(
                    children: [
                      TableCell(
                        child: Text(
                          '营养成分',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          '含量',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Text(
                          "carbohydrate",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          widget.foodDetail["carbohydrate"].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Text(
                          "fat",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          widget.foodDetail["fat"].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Text(
                          "protein",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          widget.foodDetail["protein"].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Text(
                          "calories",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TableCell(
                        child: Text(
                          widget.foodDetail["calories"].toString(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

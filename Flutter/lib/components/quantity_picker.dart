/// 数量加一减一
import 'package:flutter/material.dart';

import '../store/car_store.dart';

class QuantityPicker extends StatefulWidget {
  final Function setQuantity;
  final int index;
  const QuantityPicker({
    Key? key,
    required this.index,
    required this.setQuantity,
  }) : super(key: key);

  @override
  State<QuantityPicker> createState() => _QuantityPickerState();
}

class _QuantityPickerState extends State<QuantityPicker> {
  CarStore carStore = CarStore();
  int _quantity = 1; // 数量

  // 数量增加
  void _increment() {
    setState(() {
      _quantity++;
      widget.setQuantity(_quantity, widget.index);
    });
  }

  // 数量减少
  void _decrement() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        widget.setQuantity(_quantity, widget.index);
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: const Color(0xffdcdfe6))),
      child: Row(
        children: [
          Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  color: Color(0xfff5f7fa),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5))),
              child: Center(
                child: IconButton(
                  onPressed: _decrement,
                  icon: const Icon(
                    Icons.remove,
                    size: 10,
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              '$_quantity',
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Container(
            width: 25,
            height: 25,
            decoration: const BoxDecoration(
                color: Color(0xfff5f7fa),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5))),
            child: IconButton(
              onPressed: _increment,
              icon: const Icon(
                Icons.add,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

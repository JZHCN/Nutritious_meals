/// 自定义水平分割线组件：中间带文本
import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget {
  final String text;  // 文本
  final double textSize;  // 文字大小
  final Color textColor;  // 文本颜
  final Color color;  // 分割线颜色
  final double thickness; // 分割线厚度
  final double spacing; // 文本和分割线间隔
  final double indent; // 左缩进
  final double endIndent; // 右缩进

  const TextDivider({
    Key? key,
    this.text = "",
    this.textSize = 16.0,
    this.textColor = const Color(0xff030303),
    this.color = const Color(0xffcbcccb),
    this.thickness = 1.0,
    this.spacing = 10.0,
    this.indent = 40.0,
    this.endIndent = 40.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: color,
            thickness: thickness,
            indent: indent,
          )
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: textSize
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: color,
            thickness: thickness,
            endIndent: endIndent,
          )
        ),
      ],
    );
  }
}

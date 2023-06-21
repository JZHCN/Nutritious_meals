import 'package:flutter/material.dart';

class PickUpTime extends StatefulWidget {
  final String pickuptimestart;
  final String pickuptimeend;
  const PickUpTime(
      {Key? key, required this.pickuptimestart, required this.pickuptimeend})
      : super(key: key);

  @override
  State<PickUpTime> createState() => _PickUpTimeState();
}

class _PickUpTimeState extends State<PickUpTime> {
  TimeOfDay _start = TimeOfDay.now(); // 取餐时间段 开始时间
  TimeOfDay _end = TimeOfDay.now(); // 取餐时间段 结束时间
  // DateTime _start = DateTime.now();
  // DateTime _end = DateTime.now();

  @override
  void initState() {
    super.initState();
    _start = TimeOfDay.fromDateTime(
        DateTime.parse(widget.pickuptimestart)); // 取餐时间段 开始时间
    _end = TimeOfDay.fromDateTime(
        DateTime.parse(widget.pickuptimeend)); // 取餐时间段 结束时间
  }

  // 选择 开始时间 小时和分钟的时间选择器
  TextButton _startTimePicker(context, String helpText) {
    return TextButton(
      onPressed: () {
        showTimePicker(
          context: context,
          initialTime: _start,
          cancelText: "取消",
          confirmText: "确定",
          helpText: "选择取餐时间",
        ).then((newTime) => {
              if (newTime != null)
                {
                  setState(() {
                    _start = newTime;
                  })
                }
            });
      },
      child: Text(
        _start.format(context),
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }

  // 选择 结束时间 小时和分钟的时间选择器
  TextButton _endTimePicker(context, String helpText) {
    return TextButton(
      onPressed: () {
        showTimePicker(
          context: context,
          initialTime: _end,
          cancelText: "取消",
          confirmText: "确定",
          helpText: "选择取餐时间",
        ).then((newTime) => {
              if (newTime != null)
                {
                  setState(() {
                    _end = newTime;
                  })
                }
            });
      },
      child: Text(
        _end.format(context),
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "取餐时间段",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const Text(
            "温馨提示：超过取餐时间10分钟后不保证餐品热度",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Color(0xffc1c1c1), fontSize: 12),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: const Color(0xfff4f7fa),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  // width: 150,
                  child: _startTimePicker(context, "选择开始取餐时间"),
                ),
                const Text(
                  "\\",
                  style: TextStyle(color: Color(0xffbbbbbb)),
                ),
                SizedBox(
                  // width: 150,
                  child: _endTimePicker(context, "选择结束取餐时间"),
                ),
              ],
            ), // 小时/分钟 时间选择器
          )
        ],
      ),
    );
  }
}

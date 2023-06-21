import 'package:flutter/material.dart';
import 'package:nutritious_meals/http/apis.dart';
import 'components/food.dart';

class SearchResult extends StatefulWidget {
  final String search;
  const SearchResult({super.key, required this.search});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<dynamic> foodList = [];
  getSearchFood() async {
    var res = await Apis.getFoodByLike(widget.search);
    setState(() {
      foodList = res["data"];
    });
    // print(foodList);
  }

  @override
  void initState() {
    super.initState();
    getSearchFood();
  }

  @override
  Widget build(BuildContext context) {
    // print("@@$foodList");
    return Scaffold(
        appBar: AppBar(
          title: const Text("查询结果"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
            height: MediaQuery.of(context).size.height, // 获取当前屏幕高度
            color: const Color(0xfff7f8f7),
            child: foodList.isNotEmpty
                ? ListView.builder(
                    itemCount: foodList.length,
                    itemBuilder: (context, index) {
                      return Food(food: foodList[index]);
                    },
                  )
                : const Center(
                    child: Text("暂无此食品！"),
                  )));
  }
}

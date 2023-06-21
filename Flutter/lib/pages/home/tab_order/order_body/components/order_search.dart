import 'package:flutter/material.dart';
import 'package:nutritious_meals/components/base_toast.dart';

class OrderSearch extends StatefulWidget {
  const OrderSearch({Key? key}) : super(key: key);

  @override
  State<OrderSearch> createState() => _OrderSearchState();
}

class _OrderSearchState extends State<OrderSearch> {
  TextEditingController _searchController = TextEditingController(); // 搜索框控制器

  // 搜索的回调
  _onSearch() async {
    String query = _searchController.text;
    if (query.isEmpty) {
      BaseToast.failToast("请输入需要搜索的食品！");
    } else {
      Navigator.pushNamed(context, "/search/$query");
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: "请输入套餐名称",
            prefixIcon: const Icon(Icons.search),
            suffix: ElevatedButton(
              onPressed: () {
                _onSearch();
              },
              child: const Text("搜索"),
            ),
          ),
          onSubmitted: (String value) {
            _onSearch();
          }),
    );
  }
}

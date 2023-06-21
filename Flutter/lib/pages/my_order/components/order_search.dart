import 'package:flutter/material.dart';

class OrderSearch extends StatefulWidget {
  const OrderSearch({Key? key}) : super(key: key);

  @override
  State<OrderSearch> createState() => _OrderSearchState();
}

class _OrderSearchState extends State<OrderSearch> {
  TextEditingController _searchController = TextEditingController();  // 搜索框控制器

  // 搜索的回调
  void _onSearch() {
    String query = _searchController.text;
    print("你点了我: $query");
    // 处理搜索请求
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
        }

      ),
    );
  }
}

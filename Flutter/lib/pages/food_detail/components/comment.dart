import 'package:flutter/material.dart';
import 'package:nutritious_meals/http/apis.dart';

class Comment extends StatefulWidget {
  final int id;
  const Comment({Key? key, required this.id}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<dynamic> commentList = [];
  String username = "";

  getComment() async {
    var res = await Apis.getComment(widget.id);
    if (res["code"] == 200) {
      setState(() {
        commentList = res["data"];
      });
    }
    // print(commentList[0]);
  }

  getUserInfo(int id) {
    Apis.getUser(id).then((res) {
      if (res["code"] == 200) {
        setState(() {
          username = res["data"]["username"];
        });
      } else {
        print("没有此用户");
        return "路人甲";
      }
    });
    return username;
  }

  @override
  void initState() {
    super.initState();
    getComment();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "用户评价（${commentList.length}）",
              ),
              const Row(
                children: [
                  Text("查看全部",
                      style: TextStyle(fontSize: 12, color: Color(0xff8c8483))),
                  Icon(Icons.keyboard_arrow_right, size: 12)
                ],
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 5),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/海贼王.png",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    commentList.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                getUserInfo(commentList[0]["userid"]),
                              ),
                              Text(
                                commentList[0]["commenttime"],
                                style: const TextStyle(
                                    color: Color(0xff8c8483), fontSize: 12),
                              ),
                            ],
                          )
                        : const Text("正在加载...")
                  ],
                ),
                commentList.isNotEmpty
                    ? Row(
                        children: List.generate(
                        commentList[0]["starsnum"],
                        (index) => const Icon(
                          Icons.star,
                          color: Color(0xffffa940),
                          size: 16,
                        ),
                      ))
                    : const Text("")
              ],
            ),
          ),
          commentList.isNotEmpty
              ? Text(
                  commentList[0]["commenttext"],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12),
                )
              : const Text("正在加载..."),
        ],
      ),
    );
  }
}

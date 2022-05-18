import 'package:flutter/material.dart';
import 'package:flutter_cook/screens/home/search/search_card.dart';
import 'package:flutter_cook/widgets/cook_book_list.dart';

/// 推荐页的展开页：想作为搜索显示内容
class Trending extends StatefulWidget {
  const Trending({Key? key}) : super(key: key);

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  String? searchKey;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("美食搜索"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          SearchCard(
            isHome: false,
            onChanged: (text) {
              if (mounted) {
                setState(() {
                  searchKey = text;
                });
              }
            },
          ),
          SizedBox(height: 10),
          Expanded(
            child: CookBookList(
              searchKey: searchKey,
            ),
          ),
        ],
      ),
    );
  }
}

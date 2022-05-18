import 'package:flutter/material.dart';
import 'package:flutter_cook/route/navigator.dart';

/// 首页的搜索框
class SearchCard extends StatelessWidget {
  final bool isHome;
  final ValueChanged<String>? onChanged;

  SearchCard({
    Key? key,
    required this.isHome,
    this.onChanged,
  }) : super(key: key);

  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigatorManager.goTrending(context);
      },
      child: Card(
        elevation: 6.0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: TextField(
            enabled: !isHome,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.black,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: "搜索..",
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              suffixIcon: Icon(
                Icons.filter_list,
                color: Colors.black,
              ),
              hintStyle: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            maxLines: 1,
            controller: _searchControl,
            onSubmitted: (text) {
              if (onChanged != null) onChanged!(text);
              _searchControl.clear();
            },
          ),
        ),
      ),
    );
  }
}

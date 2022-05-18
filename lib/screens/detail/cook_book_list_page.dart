import 'package:flutter/material.dart';
import 'package:flutter_cook/widgets/cook_book_list.dart';

class CookBookListPage extends StatelessWidget {
  final String title;

  const CookBookListPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(title),
      ),
      body: CookBookList(
        searchKey: title,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/services/cook_book_service.dart';
import 'package:flutter_cook/widgets/slide_item.dart';

class RecommendCookBookWidget extends StatefulWidget {
  const RecommendCookBookWidget({Key? key}) : super(key: key);

  @override
  State<RecommendCookBookWidget> createState() =>
      _RecommendCookBookWidgetState();
}

class _RecommendCookBookWidgetState extends State<RecommendCookBookWidget> {
  late Future future;

  late List<Cook> data;

  @override
  void initState() {
    super.initState();
    data = [];
    future = initData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                final cook = data[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: SlideItem(
                    cook: cook,
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Future initData() async {
    CookInfo? cooks = await CookBookService.fetchCook();
    if (cooks != null) {
      data = cooks.data ?? [];
    }
  }
}

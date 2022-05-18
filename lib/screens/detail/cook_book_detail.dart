import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/screens/detail/cook_detail.dart';
import 'package:flutter_cook/screens/detail/detail_bar.dart';
import 'package:flutter_cook/services/cook_book_service.dart';

class CookBookDetail extends StatefulWidget {
  final int id;

  const CookBookDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<CookBookDetail> createState() => _CookBookDetailState();
}

class _CookBookDetailState extends State<CookBookDetail> {
  late Future future;
  CookDetail? cookInfo;

  @override
  void initState() {
    super.initState();
    future = initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('暂无数据'),
              );
            }
            return Stack(
              children: [
                Positioned.fill(
                  child: CookDetailPage(
                    cookDetail: cookInfo,
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).padding.top,
                  right: 0.0,
                  left: 0.0,
                  child: DetailsBar(
                    cookInfo: cookInfo,
                  ),
                ),
              ],
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
    CookDetail? cookDetail = await CookBookService.fetchCookDetail(widget.id);
    if (cookDetail == null) return;
    cookInfo = cookDetail;
  }
}

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cook/screens/detail.dart';

Dio dio = new Dio();

class FoodList extends StatefulWidget {
  FoodList({Key? key}) : super(key: key);

  @override
  _FoodListState createState() => _FoodListState();
}

// with AutomaticKeepAliveClientMixin是切换页面时状态保持
class _FoodListState extends State<FoodList>
    with AutomaticKeepAliveClientMixin {
  int page = 5;
  int pagesize = 6;
  var foodList = [];
  var total = 0;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  // 控件初始化
  @override
  void initState() {
    super.initState();
    getFoodList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodList.length,
      itemBuilder: (BuildContext context, int i) {
        var fItem = foodList[i];
        return GestureDetector(
          onTap: () {
            // 跳转到详情页
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext ctx) {
              return new FoodDetail(id: fItem['id'], title: fItem['title']);
            }));
          },
          child: Container(
            height: 130,
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black12))),
            child: Row(
              children: <Widget>[
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(fItem['images']['small']),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('菜谱名称：凉菜'),
                      Text('创建日期：2022.03.01'),
                      Text('收藏数：10'),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
        // return Text(fItem['title']);
        // return Container(
        //   height: 200,
        //   decoration: BoxDecoration(
        //       border: Border(top: BorderSide(color: Colors.black12))),
        //   child: Row(
        //     children: <Widget>[
        //       Image.network(
        //         fItem['images']['small'],
        //         width: 130,
        //         height: 180,
        //         fit: BoxFit.cover,
        //       ),
        //       Container(
        //         padding: EdgeInsets.only(left: 10),
        //         height: 200,
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           children: <Widget>[
        //             Text('电影名称：${fItem['title']}'),
        //             Text('上映年份：${fItem['year']}年'),
        //             Text('电影类型：${fItem['genres'].join('，')}'),
        //             Text('豆瓣评分：${fItem['title']}'),
        //             Text('主要演员：${fItem['title']}'),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        // );
      },
    );
    // return Text('FoodList' + '${foodList.length}');
  }

  // 获取食物列表
  getFoodList() async {
    int offset = (page - 1) * pagesize;
    var response = await dio.get(
        'http://www.liulongbin.top:3005/api/v2/movie/top250?start=$offset&count=$pagesize');

    // 服务器返回的数据
    var result = response.data;
    print(result);

    // 为私有数据赋值必须放到 setState 函数中，页面才会更新
    setState(() {
      // 通过 dio 返回的数据，必须用 [] 来访问
      foodList = result['subjects'];
      total = result['total'];
    });
  }
}

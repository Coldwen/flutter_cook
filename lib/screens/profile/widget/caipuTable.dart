// 我的菜谱
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/model/star.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/services/star_service.dart';
import 'package:flutter_cook/util/string_util.dart';
import 'package:flutter_cook/widgets/cook_book_item.dart';
import 'package:flutter_cook/widgets/cook_book_list.dart';
import 'package:flutter_cook/widgets/cook_refresher_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../widgets/trending_item.dart';
import '../../home/model/caipu_list.dart';

class CaipuTable extends StatelessWidget {
  const CaipuTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StarList();
  }
}

class StarList extends StatefulWidget {
  const StarList({Key? key}) : super(key: key);

  @override
  State<StarList> createState() => _StarListState();
}

class _StarListState extends State<StarList> {
  late int page;

  late RefreshController _refreshController;

  List<StarInfo>? cooks;

  @override
  void initState() {
    super.initState();
    cooks;
    page = 1;
    _refreshController = RefreshController(initialRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    if (cooks != null && cooks!.isEmpty) {
      return const Center(
        child: Text(
          '暂无收藏',
          style: TextStyle(color: Colors.black54),
        ),
      );
    }
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: const WaterDropHeader(),
      footer: CookRefresherFooter(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          return _CookBookItem(
            onTap: () {
              NavigatorManager.goCookDetail(context, cooks![index].recipeId!);
            },
            cook: cooks![index],
          );
        },
        itemCount: cooks?.length ?? 0,
      ),
    );
  }

  Future _onRefresh() async {
    page = 1;
    cooks = [];
    Star? star = await StarService.fetchStar();
    if (star != null) {
      cooks = star.data ?? [];
    }
    if (mounted) setState(() {});
    _refreshController.refreshCompleted();
  }

  Future _onLoading() async {
    page++;
    Star? star = await StarService.fetchStar(page);

    if (star != null) {
      if (star.data?.length == 0) {
        _refreshController.loadNoData();
      } else {
        cooks!.addAll(star.data ?? []);
        _refreshController.loadComplete();
      }
    } else {
      _refreshController.loadNoData();
    }
    if (mounted) setState(() {});
  }
}

class _CookBookItem extends StatelessWidget {
  final StarInfo cook;

  final VoidCallback? onTap;

  const _CookBookItem({
    Key? key,
    required this.cook,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 3.0,
          child: Container(
            height: 300,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: cook.recipeInfo?.recipeImage ?? '',
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Container(color: Colors.black12);
                      },
                      height: 200,
                    ),
                  ),
                ),
                SizedBox(height: 7.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    (cook.recipeInfo?.name ?? '').defaultStr('菜谱'),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: 7.0),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    (cook.recipeInfo?.story ?? '').defaultStr('暂无简介'),
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

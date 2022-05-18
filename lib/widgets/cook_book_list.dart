import 'package:flutter/material.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/route/navigator.dart';
import 'package:flutter_cook/services/cook_book_service.dart';
import 'package:flutter_cook/widgets/cook_book_item.dart';
import 'package:flutter_cook/widgets/cook_refresher_footer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CookBookList extends StatefulWidget {
  final bool isSelf;
  final String? searchKey;

  const CookBookList({
    Key? key,
    this.isSelf = false,
    this.searchKey,
  }) : super(key: key);

  @override
  State<CookBookList> createState() => _CookBookListState();
}

class _CookBookListState extends State<CookBookList> {
  late int page;

  late RefreshController _refreshController;

  List<Cook>? cooks;

  @override
  void initState() {
    super.initState();
    cooks;
    page = 1;
    _refreshController = RefreshController(initialRefresh: true);
  }

  @override
  void didUpdateWidget(covariant CookBookList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.searchKey != widget.searchKey) {
      page = 1;
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        cooks!.clear();
        _refreshController.requestRefresh();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cooks != null && cooks!.isEmpty) {
      return const Center(
        child: Text(
          '暂无菜谱',
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
          return CookBookItem(
            onTap: () {
              NavigatorManager.goCookDetail(context, cooks![index].id!);
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
    CookInfo? cookInfo;
    if (widget.isSelf) {
      cookInfo = await CookBookService.fetchSelfCook();
    } else {
      cookInfo = await CookBookService.fetchCook(key: widget.searchKey);
    }
    if (cookInfo != null) {
      cooks = cookInfo.data ?? [];
    }
    if (mounted) setState(() {});
    _refreshController.refreshCompleted();
  }

  Future _onLoading() async {
    page++;
    CookInfo? cookInfo;
    if (widget.isSelf) {
      cookInfo = await CookBookService.fetchSelfCook(page);
    } else {
      cookInfo =
          await CookBookService.fetchCook(page: page, key: widget.searchKey);
    }
    if (cookInfo != null) {
      if (cookInfo.data?.length == 0) {
        _refreshController.loadNoData();
      } else {
        cooks!.addAll(cookInfo.data ?? []);
        _refreshController.loadComplete();
      }
    } else {
      _refreshController.loadNoData();
    }
    if (mounted) setState(() {});
  }

  void _updateKeyword() {}
}

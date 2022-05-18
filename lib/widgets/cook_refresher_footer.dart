import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CookRefresherFooter extends CustomFooter {
  CookRefresherFooter({
    Key? key,
    double height = 60,
    ModeChangeCallBack? onModeChange,
    OffsetCallBack? onOffsetChange,
    VoidFutureCallBack? endLoading,
    VoidFutureCallBack? readyLoading,
    LoadStyle loadStyle = LoadStyle.ShowAlways,
    Function? onClick,
  }) : super(
            key: key,
            height: height,
            onModeChange: onModeChange,
            loadStyle: loadStyle,
            onOffsetChange: onOffsetChange,
            endLoading: endLoading,
            onClick: onClick,
            readyLoading: readyLoading,
            builder: (context, mode) {
              return _Footer(mode: mode ?? LoadStatus.idle);
            });
}

class _Footer extends StatelessWidget {
  final LoadStatus mode;

  const _Footer({
    Key? key,
    required this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (mode == LoadStatus.noMore) {
      body = const Text('到底啦');
    } else if (mode == LoadStatus.loading) {
      body = const CupertinoActivityIndicator();
    } else if (mode == LoadStatus.failed) {
      body = const Text('加载失败～请重试');
    } else if (mode == LoadStatus.canLoading) {
      body = const Text('松手加载更多');
    } else  {
      body = const Text('下拉加载更多～');
    }
    return SizedBox(
      height: 55.0,
      child: Center(child: body),
    );
  }
}

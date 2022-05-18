import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/services/cook_book_service.dart';
import 'package:flutter_cook/services/star_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailsBar extends StatefulWidget {
  final CookDetail? cookInfo;

  const DetailsBar({Key? key, required this.cookInfo}) : super(key: key);

  @override
  State<DetailsBar> createState() => _DetailsBarState();
}

class _DetailsBarState extends State<DetailsBar> {
  late int isFollow;

  @override
  void initState() {
    super.initState();
    isFollow = widget.cookInfo?.isFollow ?? 0;
  }

  @override
  void didUpdateWidget(covariant DetailsBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    logger.v(widget.cookInfo?.isFollow);
    isFollow = widget.cookInfo?.isFollow ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    bool isSelf = widget.cookInfo?.info?.userId == Application.userModel.id &&
        widget.cookInfo?.info?.userId != null;
    return Container(
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (isFollow == 0) {
                StarService.star(widget.cookInfo!.info!.id!);
                widget.cookInfo?.isFollow == 1;
                isFollow = 1;
                Fluttertoast.showToast(msg: '关注成功');
              } else {
                StarService.star(widget.cookInfo!.info!.id!);
                widget.cookInfo?.isFollow == 0;
                isFollow = 0;
                Fluttertoast.showToast(msg: '取消关注');
              }
              setState(() {});
            },
            child: Icon(isFollow == 1 ? Icons.star : Icons.star_border,
                color: Colors.black87),
          ),
          if (isSelf)
            GestureDetector(
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('警告'),
                      content: Text('确定删除该菜谱吗？'),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text('取消'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoDialogAction(
                          child: const Text('确定'),
                          onPressed: () {
                            CookBookService.deleteCookDetail(
                                widget.cookInfo!.info!.id!);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(Icons.delete, color: Colors.black87),
            )
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/caipu/model/models.dart';
import 'package:flutter_cook/caipu/player/auto_play_video.dart';
import 'package:flutter_cook/caipu/util/toast.dart';
import 'package:flutter_cook/model/comment.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:flutter_cook/services/comment_service.dart';
import 'package:flutter_cook/services/cook_book_service.dart';
import 'package:flutter_cook/services/follow_service.dart';

class CookDetailPage extends StatefulWidget {
  final CookDetail? cookDetail;

  const CookDetailPage({Key? key, required this.cookDetail}) : super(key: key);

  @override
  State<CookDetailPage> createState() => _CookDetailPageState();
}

class _CookDetailPageState extends State<CookDetailPage> {
  CookDetail? cookDetail;

  @override
  void initState() {
    super.initState();
    cookDetail = widget.cookDetail;
  }

  @override
  Widget build(BuildContext context) {
    // if (cookDetail == null) return Container();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildUser(),
                  const SizedBox(height: 10),
                  buildLabel(),
                  const SizedBox(height: 10),
                  buildUsed(),
                  const SizedBox(height: 10),
                  buildTip(),
                  const SizedBox(height: 10),
                  buildStep(),
                  const SizedBox(height: 30),
                  buildTime(),
                  const SizedBox(height: 20),
                  buildComment(),
                  const SizedBox(height: 30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    String image = cookDetail?.info?.recipeImage ?? '';
    String video = cookDetail?.info?.recipeVideo ?? '';
    Widget? child;
    if (video != '') {
      child = AutoPlayVideo(path: video);
    } else if (image != '') {
      child = CachedNetworkImage(
        imageUrl: image,
        height: 200,
        fit: BoxFit.cover,
        errorWidget: (context, url, error) => ColoredBox(color: Colors.white70),
      );
    }
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: child ?? Container(),
    );
  }

  Widget buildUser() {
    bool isSelf = cookDetail?.info?.userId == Application.userModel.id &&
        cookDetail?.info?.userId != null;
    if (isSelf) return Container();
    return SizedBox(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: CachedNetworkImage(
              imageUrl: cookDetail?.info?.userInfo?.photo ?? '',
              height: 30,
              width: 30,
              errorWidget: (context, url, error) =>
                  ColoredBox(color: Colors.black12),
            ),
          ),
          SizedBox(width: 20),
          Text(cookDetail?.info?.userInfo?.nikeName ?? '未命名昵称'),
          Spacer(),
          cookDetail?.isFollow == 0
              ? GestureDetector(
                  onTap: () {
                    cookDetail?.isFollow = 1;
                    FollowService.followUser(cookDetail!.info!.userInfo!.id!);
                    showToast('关注成功');
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    alignment: Alignment.center,
                    child: Text(
                      '关注',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget buildLabel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(cookDetail?.info?.story ?? '暂无简介'),
        SizedBox(height: 10),
        SizedBox(
          height: 30,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              label(cookDetail?.info?.difficulty ?? '容易做'),
              SizedBox(width: 10),
              label(cookDetail?.info?.duration ?? '15分钟左右'),
              SizedBox(width: 10),
              label(cookDetail?.info?.sort ?? '川菜'),
            ],
          ),
        )
      ],
    );
  }

  Widget buildUsed() {
    String useds = cookDetail?.info?.useds ?? '';
    if (useds == '') return Container();
    List<Useds> usedsList = (jsonDecode(useds) as List<dynamic>)
        .map((e) => Useds.fromJson(e as Map<String, dynamic>))
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('用料', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ...usedsList
            .map((e) => SizedBox(
                  height: 20,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(flex: 1, child: Text('食材:${e.shicai!}')),
                      Expanded(flex: 1, child: Text('用料:${e.count!}')),
                    ],
                  ),
                ))
            .toList(),
      ],
    );
  }

  Widget buildTip() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('小贴士',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(cookDetail?.info?.tips ?? '暂无'),
      ],
    );
  }

  Widget buildStep() {
    String steps = cookDetail?.info?.steps ?? '';
    if (steps == '') return Container();
    List<Steps> usedsList = (jsonDecode(steps) as List<dynamic>)
        .map((e) => Steps.fromJson(e as Map<String, dynamic>))
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...List.generate(usedsList.length, (index) {
          return Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '步骤${index + 1}',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Image.network(usedsList[index].image!, height: 200),
              SizedBox(height: 10),
              Text(usedsList[index].intro!),
              Divider(),
            ],
          );
        }).toList(),
      ],
    );
  }

  Widget buildTime() {
    return Text(
      '菜谱更新于${cookDetail?.info?.updatedAt ?? '2020-03-30'}',
      style: TextStyle(color: Colors.black45, fontSize: 11),
    );
  }

  Widget label(String content) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(0xFF78C2F4),
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Text(
        content,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  TextEditingController textController = TextEditingController();

  Widget buildComment() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '这道菜的评论',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        buildDefaultUesrs(),
        SizedBox(height: 10),
        SizedBox(
          height: 40,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: CachedNetworkImage(
                  imageUrl: Application.userModel.photo ?? '',
                  height: 30,
                  width: 30,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      ColoredBox(color: Colors.black12),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '喜欢评论的人，做饭一定很好吃~',
                      hintStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    controller: textController,
                    onSubmitted: (text) {
                      if (text == '') return;
                      refresh(text);
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void refresh(String text) async {
    await CommentService.addComment(widget.cookDetail!.info!.id!, text);
    textController.clear();
    CookDetail? detail =
        await CookBookService.fetchCookDetail(widget.cookDetail!.info!.id!);
    if (detail == null) return;
    cookDetail = detail;
    if (mounted) {
      setState(() {});
    }
  }

  Widget buildDefaultUesrs() {
    List<Comment> comments = cookDetail?.info?.commentRecipeInfo ?? [];
    if (comments.isEmpty) return Container();
    return Column(
      children: [
        ...comments.map((e) {
          return Container(
            height: 60,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: CachedNetworkImage(
                    imageUrl: e.userInfo?.photo ?? '',
                    height: 30,
                    width: 30,
                    errorWidget: (context, url, error) =>
                        ColoredBox(color: Colors.black12),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      e.userInfo?.nikeName ?? '未命名昵称',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2),
                    Text(
                      e.des ?? '',
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ],
                )
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}

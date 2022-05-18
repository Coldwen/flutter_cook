import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/screens/profile/user/widget/user_item.dart';
import 'package:flutter_cook/services/follow_service.dart';

class FollowPage extends StatefulWidget {
  const FollowPage({Key? key}) : super(key: key);

  @override
  State<FollowPage> createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {
  late Future future;

  List<UserInfo>? follows;

  @override
  void initState() {
    super.initState();
    follows = [];
    future = initData();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('关注'),
        ),
        body: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (follows?.length == 0) {
                return Center(
                  child: Text('暂无关注'),
                );
              }
              return ListView.separated(
                itemCount: follows?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return UserItem(
                    userModel: follows![index].userInfo!,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Future initData() async {
    final data = await FollowService.fetchFollow();
    follows = data?.data ?? [];
    Application.userModel.follows = data?.total ?? 0;
  }
}

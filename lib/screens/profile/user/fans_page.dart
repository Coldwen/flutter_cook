import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/screens/profile/user/widget/user_item.dart';
import 'package:flutter_cook/services/follow_service.dart';

class FansPage extends StatefulWidget {
  const FansPage({Key? key}) : super(key: key);

  @override
  State<FansPage> createState() => _FansPageState();
}

class _FansPageState extends State<FansPage> {
  late Future future;

  List<UserInfo>? fans;

  @override
  void initState() {
    super.initState();
    fans = [];
    future = initData();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('粉丝'),
        ),
        body: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (fans?.length == 0) {
                return Center(
                  child: Text('暂无粉丝'),
                );
              }
              return ListView.separated(
                itemCount: fans?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return UserItem(
                    userModel: fans![index].fansInfo!,
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
    final data = await FollowService.fetchFans();
    fans = data?.data ?? [];
    Application.userModel.fans = data?.total ?? 0;
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/caipu/util/picker_media.dart';
import 'package:flutter_cook/model/user.dart';
import 'package:flutter_cook/services/login_service.dart';

class UserHeader extends StatefulWidget {
  final double size;

  const UserHeader({Key? key, required this.size}) : super(key: key);

  @override
  State<UserHeader> createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  @override
  Widget build(BuildContext context) {
    UserModel userModel = Application.userModel;
    return GestureDetector(
      onTap: () {
        selectImage();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(widget.size / 2)),
        child: CachedNetworkImage(
          imageUrl: userModel.photo ?? '',
          height: widget.size,
          width: widget.size,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) {
            return ColoredBox(color: Colors.black12);
          },
        ),
      ),
    );
  }

  void selectImage() async {
    String? path = await pickerMedia(context, type: FileType.image);
    Application.userModel.photo = path;
    await LoginService.updateUser(Application.userModel);
    Application.saveUser(Application.userModel);
    if (mounted) {
      setState(() {});
    }
  }
}

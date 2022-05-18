import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/caipu/util/picker_media.dart';
import 'package:flutter_cook/screens/login/login_page.dart';
import 'package:flutter_cook/screens/profile/widget/user_header.dart';

class LoginHeader extends StatefulWidget {
  final LoginType loginType;
  final ValueChanged<String> onChanged;
  final String? path;

  const LoginHeader({
    Key? key,
    required this.loginType,
    required this.onChanged,
    required this.path,
  }) : super(key: key);

  @override
  State<LoginHeader> createState() => _LoginHeaderState();
}

class _LoginHeaderState extends State<LoginHeader> {
  String? path;

  @override
  void initState() {
    super.initState();
    path = widget.path;
  }

  @override
  void didUpdateWidget(covariant LoginHeader oldWidget) {
    super.didUpdateWidget(oldWidget);
    path = widget.path;
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    child = GestureDetector(
      onTap: () {
        if (widget.loginType == LoginType.login) return;
        selectImage();
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(45.0)),
        child: CachedNetworkImage(
          imageUrl: path ?? '',
          height: 90,
          width: 90,
          fit: BoxFit.cover,
          errorWidget: (context, url, error) {
            return ColoredBox(color: Colors.black12);
          },
        ),
      ),
    );

    return child;
  }

  void selectImage() async {
    String? image = await pickerMedia(context, type: FileType.image);
    if (image == null) return;
    path = image;
    widget.onChanged(image);
    if (mounted) {
      setState(() {});
    }
  }
}

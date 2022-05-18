import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cook/app/application.dart';
import 'package:flutter_cook/caipu/player/auto_play_video.dart';
import 'package:flutter_cook/model/cook_book.dart';
import 'package:video_player/video_player.dart';

import '../../player/player_page.dart';
import '../../util/picker_media.dart';
import '../../widget/edit_text_widget.dart';

class RecipesIntro extends StatefulWidget {
  final Cook cook;

  const RecipesIntro({Key? key, required this.cook}) : super(key: key);

  @override
  State<RecipesIntro> createState() => _RecipesIntroState();
}

class _RecipesIntroState extends State<RecipesIntro> {
  TextEditingController name = TextEditingController();
  TextEditingController intro = TextEditingController();

  // String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildImage(),
        _buildName(),
        _buildIntro(),
      ],
    );
  }

  Widget _buildImage() {
    return GestureDetector(
      onLongPress: () => _imageLongPress(),
      onTap: () => _pickerImage(),
      child: Container(
        width: double.infinity,
        height: 250,
        color: Colors.grey[200],
        alignment: Alignment.center,
        child:
            widget.cook.recipeImage == null && widget.cook.recipeVideo == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        '+菜谱封面(或一分钟小视频)',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        '诱人的封面图是吸引厨友的关键',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                // : HomeContro.recipesInfo.video!.isEmpty
                //     ? Image.file(
                //         File(HomeContro.recipesInfo.image!),
                //         width: double.infinity,
                //         height: 250,
                //         fit: BoxFit.cover,
                //       )
                //     : _buildVideoPlayer(),
                : widget.cook.recipeVideo == null
                    ? Image.network(
                        widget.cook.recipeImage!,
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      )
                    : AutoPlayVideo(path: widget.cook.recipeVideo!),
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: EditTextWidget(
        controller: name,
        hint: '请输入菜谱名称',
        fontSize: 20,
        textAlign: TextAlign.center,
        onChanged: (String text) => widget.cook.name = text.toString(),
      ),
    );
  }

  Widget _buildIntro() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: EditTextWidget(
        controller: intro,
        hint: '请输入菜谱介绍',
        maxLines: 5,
        textInputAction: TextInputAction.newline,
        onChanged: (String text) => widget.cook.story = text.trim(),
      ),
    );
  }

  ///图片长按
  _imageLongPress() {
    bool isVideo = widget.cook.recipeVideo != null;
    String? path = widget.cook.recipeVideo;
    if (isVideo) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlayerPage(path: path!),
        ),
      );
    }
  }

  ///选择封面
  _pickerImage() async {
    await pickerMedia(context, cook: widget.cook);
    setState(() {});
  }
}

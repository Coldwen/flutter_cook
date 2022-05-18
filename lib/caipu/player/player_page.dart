import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {
  final String path;

  const PlayerPage({Key? key, required this.path}) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  VideoPlayerController? videoPlayerController;

  ///播放进度
  double progress = 0.0;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.file(File(widget.path))
      ..initialize()
      ..setLooping(true) //循环播放
      ..play();
    videoPlayerController!.addListener(() {
      if (videoPlayerController!.value.isPlaying) {
        Duration position = videoPlayerController!.value.position;
        Duration total = videoPlayerController!.value.duration;
        progress = position.inMilliseconds / total.inMilliseconds;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: AspectRatio(
            aspectRatio: videoPlayerController!.value.aspectRatio,
            child: VideoPlayer(videoPlayerController!),
          ),
        ),
        _buildProgressBar(),
      ],
    );
  }

  ///进度条
  Widget _buildProgressBar() {
    ///屏幕宽度
    double screenW = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          AnimatedContainer(
            transformAlignment: Alignment.center,
            duration: const Duration(milliseconds: 100),
            width: double.infinity,
            height: 5,
            color: const Color.fromARGB(255, 116, 116, 116),
          ),
          AnimatedContainer(
            transformAlignment: Alignment.center,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 100),
            width: progress <= 0 ? 0 : progress * screenW,
            height: 5,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

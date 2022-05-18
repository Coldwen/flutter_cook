import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AutoPlayVideo extends StatefulWidget {
  final String path;

  const AutoPlayVideo({Key? key, required this.path}) : super(key: key);

  @override
  State<AutoPlayVideo> createState() => _AutoPlayVideoState();
}

class _AutoPlayVideoState extends State<AutoPlayVideo> {
  late VideoPlayerController _controller;

  ///播放进度
  double progress = 0.0;

  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    initController();
  }

  @override
  void didUpdateWidget(covariant AutoPlayVideo oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.path != widget.path) {
      _controller = VideoPlayerController.network(widget.path);

      _controller.addListener(() {
        setState(() {});
      });
      _controller.setLooping(true);
      _controller.initialize().then((_) => setState(() {}));
      _controller.play();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.tightFor(height: 250),
      child: _chewieController != null &&
              _chewieController!.videoPlayerController.value.isInitialized
          ? IgnorePointer(
            child: Chewie(
                controller: _chewieController!,
              ),
          )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading'),
              ],
            ),
    );
  }

  Future initController() async {
    _controller = VideoPlayerController.network(widget.path);
    await _controller.initialize();
    _createChewieController();
    setState(() {});
  }

  Future _createChewieController() async {
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      autoPlay: true,
      looping: true,
      hideControlsTimer: const Duration(seconds: 1),
    );
  }
}

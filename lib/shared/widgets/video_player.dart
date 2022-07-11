import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/utils/utils.dart';
import 'package:todo_app/shared/widgets/app_progress.dart';
import 'package:todo_app/shared/widgets/error_screen.dart';
import 'package:video_player/video_player.dart';

class AppVideoPlayer extends StatefulWidget {
  final String asset;

  const AppVideoPlayer({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late final VideoPlayerController videoPlayerController;

  @override
  void initState() {
    if (Platform.isAndroid) {
      videoPlayerController = VideoPlayerController.contentUri(
        getUri(widget.asset)!,
      );
    } else {
      videoPlayerController = VideoPlayerController.asset(
        'file:/${widget.asset}',
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ChewieController>(
      builder: (BuildContext context, AsyncSnapshot<ChewieController> projectSnap) {
        if (projectSnap.connectionState == ConnectionState.waiting) {
          return const AppProgress();
        } else {
          return projectSnap.data == null ? const ErrorScreen() : FittedBox(
            fit: BoxFit.cover,
            child: Chewie(
              controller: projectSnap.data!,
            ),
          );
        }
      },
      future: _getVideoController(),
    );
  }

  Future<ChewieController> _getVideoController() async {
    await videoPlayerController.initialize();
    return ChewieController(
      looping: false,
      autoPlay: false,
      allowMuting: true,
      showOptions: false,
      allowFullScreen: false,
      videoPlayerController: videoPlayerController,
      errorBuilder: (BuildContext context, String str) => const ErrorScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

import '../../../../../core/constant/app_colors.dart';

class LessonVideoViewScreen extends StatefulWidget {
  const LessonVideoViewScreen({super.key, required this.url});
  final String url;

  @override
  State<LessonVideoViewScreen> createState() => _LessonVideoViewScreenState();
}

class _LessonVideoViewScreenState extends State<LessonVideoViewScreen> {
  late final PodPlayerController controller;
  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.network(widget.url),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: true, isLooping: false, videoQualityPriority: [720, 360]))
      ..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.appColorBlack,
        appBar: AppBar(
          leading: const BackButton(color: AppColors.appColorWhite),
          backgroundColor: AppColors.appColorBlack,
        ),
        body: PodVideoPlayer(controller: controller));
  }
}

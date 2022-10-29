import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magmel/controllers/video_controller.dart';
import 'package:magmel/views/screens/home/video_poster/poster_screen.dart';
import 'package:magmel/views/screens/home/video_poster/video_screen.dart';

class VideoScreenSwitcher extends StatelessWidget {
  VideoScreenSwitcher({super.key});

  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return PageView.builder(
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return PageView.builder(
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return [
                  VideoScreen(data: data),
                  PosterScreen(data: data),
                ][index];
              },
            );
          },
        );
      },
    );
  }
}

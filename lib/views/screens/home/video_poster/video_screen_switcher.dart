import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magmel/controllers/video_controller.dart';
import 'package:magmel/views/screens/home/profile_screen.dart';
import 'package:magmel/views/screens/home/video_poster/shop_screen.dart';
import 'package:magmel/views/screens/home/video_poster/video_screen.dart';

import '../../../../constants.dart';

class VideoScreenSwitcher extends StatelessWidget {
  VideoScreenSwitcher({super.key});

  final VideoController videoController =
      Get.put(VideoController(), permanent: true);

  final PageController pagecontroller = Get.put(
      PageController(initialPage: 0, viewportFraction: 1),
      permanent: true);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        print('isFollowing build');
        return PageView.builder(
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Obx(
              () {
                // var debuglist = videoController.isFollowingSet;
                // var pageNumber = debuglist.contains(data.uid) ? 3 : 2;
                var pageNumber =
                    videoController.isFollowingSet.contains(data.uid) ? 3 : 2;
                print('isFollowing pageNumber $pageNumber');
                // print('isFollowing pageNumber ${debuglist}');
                return PageView.builder(
                  controller: pagecontroller,
                  itemCount: pageNumber,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return [
                      VideoScreen(data: data),
                      ProfileScreen(uid: data.uid),
                      const ShopScreen(),
                    ][index];
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

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

  // bool isFollowing = false;

  // void checkIfFollowing(String uid) async {
  //   DocumentSnapshot userId = await firestore
  //       .collection('users')
  //       .doc(uid)
  //       .collection('followers')
  //       .doc(authController.user.uid)
  //       .get();
  //   isFollowing = userId.exists;
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var itemCount = videoController.debugNumber.value;
        print('isFollowing after obs');
        var pageNumber =
            videoController.isFollowingSet.contains('Shin Dev') ? 3 : 2;
        // print('isFollowing Shin Dev $pageNumber');
        // var pageNumber =
        //     videoController.isFollowingSet.contains(data.uid.obs) ? 3 : 2;
        return PageView.builder(
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            // print('isFollowing $pageNumber');
            print('isFollowing rebuild');
            // return Obx(
            //   () {
            // var pageNumber =
            //     videoController.isFollowingSet.contains(data.uid.obs)
            //         ? 3
            //         : 2;
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
            //   },
            // );
          },
        );
      },
    );
  }
}

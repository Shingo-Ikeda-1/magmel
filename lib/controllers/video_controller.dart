import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:magmel/constants.dart';
import 'package:magmel/models/video.dart';

class VideoController extends GetxController {
  final Rx<List<Video>> _videoList = Rx<List<Video>>([]);
  final RxSet<String> _isFollowingSet = <String>{}.obs;
  // Let's make it Set<RxString> and we'll be observable
  List<Video> get videoList => _videoList.value;
  Set<String> get isFollowingSet => _isFollowingSet;

  RxInt debugNumber = 3.obs;

  @override
  void onInit() {
    super.onInit();
    _videoList.bindStream(
      firestore.collection('videos').snapshots().map(
        (QuerySnapshot query) {
          List<Video> retVal = [];
          Set<String> uidSet = <String>{};
          query.docs.asMap().forEach((index, element) {
            // for (var element in query.docs) {
            retVal.add(
              Video.fromSnap(element),
            );
            uidSet.add(element['uid']);
            print('isFollowing ${index} ${retVal[index].username} ${uidSet}');
          });
          checkIfFollowing(uidSet);
          print('isFollowing u');
          return retVal;
        },
      ),
    );

    print('isFollowing a');
  }

  void checkIfFollowing(Set<String> uids) async {
    for (String uid in uids) {
      bool isFollowing;
      isFollowing = (await firestore
              .collection('users')
              .doc(uid)
              .collection('followers')
              .doc(authController.user.uid)
              .get())
          .exists;
      if (isFollowing) {
        _isFollowingSet.add(uid);
        print('isFollowing adding to Set');
      }
      print(_isFollowingSet);
    }
  }

  void likeVideo(String id) async {
    DocumentSnapshot doc = await firestore.collection('videos').doc(id).get();
    var uid = authController.user.uid;
    if ((doc.data()! as dynamic)['likes'].contains(uid)) {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await firestore.collection('videos').doc(id).update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }
  }

  void followUser(String uid) {
    print('_isFollowingSet.contains(uid) is ${_isFollowingSet.contains(uid)}');
    _isFollowingSet.contains(uid)
        ? _isFollowingSet.remove(uid)
        : _isFollowingSet.add(uid);
    print('_isFollowingSet.contains(uid) is ${_isFollowingSet.contains(uid)}');
    debugNumber.value = 2;
    print('isFollowing debugNumber ${debugNumber}');
    _isFollowingSet.refresh();
  }
}

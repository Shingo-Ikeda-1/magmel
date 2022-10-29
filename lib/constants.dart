import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:magmel/controllers/auth_controller.dart';
import 'package:magmel/views/screens/home/add_video_screen.dart';
import 'package:magmel/views/screens/home/musium_screen.dart';
import 'package:magmel/views/screens/home/profile_screen.dart';
import 'package:magmel/views/screens/home/search_screen.dart';
import 'package:magmel/views/screens/home/video_poster/video_screen.dart';
import 'package:magmel/views/screens/home/video_poster/video_screen_switcher.dart';

List pages = [
  const AddVideoScreen(),
  SearchScreen(),
  VideoScreenSwitcher(),
  MusiumScreen(),
  ProfileScreen(uid: authController.user.uid),
];

// COLORS
const backgroundColor = Colors.white;
var buttonColor = Colors.blue;
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;

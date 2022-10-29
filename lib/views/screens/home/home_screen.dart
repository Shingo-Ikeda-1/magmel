import 'package:flutter/material.dart';
import 'package:magmel/constants.dart';
import 'package:magmel/views/widgets/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx) {
          setState(() {
            pageIdx = idx;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        selectedItemColor: buttonColor,
        unselectedItemColor: Colors.black,
        currentIndex: pageIdx,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/images/add19.PNG"),
              size: 40,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: '',
          ),
        ],
      ),
      body: pages[pageIdx],
    );
  }
}

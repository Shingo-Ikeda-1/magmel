import 'package:flutter/material.dart';

class PosterScreen extends StatelessWidget {
  const PosterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Image.asset('assets/images/add6.PNG'),
      ),
    );
  }
}

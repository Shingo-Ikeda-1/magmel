import 'package:flutter/material.dart';

class MusiumScreen extends StatelessWidget {
  MusiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Text("Header 1", style: TextStyle(backgroundColor: Colors.teal)),
              Text("Header 2"),
              Text("Header 3"),
              Text("Header 4"),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.red,
                height: 200,
              ),
              Container(
                color: Colors.green,
                height: 200,
              ),
              Container(
                color: Colors.orange,
                height: 200,
              ),
              Container(
                color: Colors.blue,
                height: 200,
              ),
              Container(
                color: Colors.red,
                height: 200,
              ),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.blue),
              Container(color: Colors.green),
              Container(color: Colors.yellow),
              Container(color: Colors.orange),
              Container(color: Colors.blue),
              Container(color: Colors.red),
            ],
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            childCount: 20,
          ),
        )
      ],
    );
  }
}

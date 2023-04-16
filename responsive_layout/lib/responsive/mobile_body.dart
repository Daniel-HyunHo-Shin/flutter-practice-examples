import 'package:flutter/material.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('M O B I L E'),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.grey[400],
              ),
            ),
          ),

          // comment section & recommended videos
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey[400],
                    height: 120,
                    child: Center(
                      child: Text('Comment $index'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

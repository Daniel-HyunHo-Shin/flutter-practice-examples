import 'package:flutter/material.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('D E S K T O P'),
        backgroundColor: Colors.white,
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                // youtube video
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
                          child: Center(child: Text('Comment: $index')),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          // Second Column
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Container(
              width: 200,
              color: Colors.grey[400],
            ),
          )
        ],
      ),
    );
  }
}

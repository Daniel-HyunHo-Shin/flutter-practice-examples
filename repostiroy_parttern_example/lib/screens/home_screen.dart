import 'package:flutter/material.dart';
import 'package:repostiroy_parttern_example/screens/album_screen.dart';
import 'package:repostiroy_parttern_example/screens/post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const AlbumScreen(),
                  ),
                );
              },
              child: const Text('Album Screen'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PostScreen(),
                  ),
                );
              },
              child: const Text('Post Screen'),
            ),
          ],
        ),
      ),
    );
  }
}

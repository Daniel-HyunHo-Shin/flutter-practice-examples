import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repostiroy_parttern_example/controllers/post_controller.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postController = ref.watch(postControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
      ),
      body: FutureBuilder(
        future: postController.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final posts = snapshot.data!;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text('body: ${post.body}'),

                  // Additional album details can be displayed here
                );
              },
            );
          } else {
            return const Center(child: Text('No albums found.'));
          }
        },
      ),
    );
  }
}

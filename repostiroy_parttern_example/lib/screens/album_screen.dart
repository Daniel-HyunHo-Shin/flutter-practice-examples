import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/album_controller.dart';

class AlbumScreen extends ConsumerWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumController = ref.watch(albumControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Screen'),
      ),
      body: FutureBuilder(
        future: albumController.getAlbums(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];
                return ListTile(
                  title: Text(album.title),
                  subtitle: Text('ID: ${album.id}'),
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

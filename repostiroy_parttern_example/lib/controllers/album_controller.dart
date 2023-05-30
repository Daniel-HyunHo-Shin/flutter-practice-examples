// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/album.dart';
import '../repositories/json_repository.dart';

/// Provider of Controller
final albumControllerProvider = Provider((ref) {
  final albumRepository = ref.watch(jsonRepositoryProvider);
  return AlbumController(albumRepository: albumRepository, ref: ref);
});

class AlbumController {
  final JsonRepository albumRepository;
  final ProviderRef ref;

  AlbumController({
    required this.albumRepository,
    required this.ref,
  });

  Future<List<Album>> getAlbums() async {
    final albums = await albumRepository.getAlbums();
    return albums;
  }
}

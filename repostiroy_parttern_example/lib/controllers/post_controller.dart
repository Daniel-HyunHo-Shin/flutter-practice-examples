// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/Post.dart';
import '../repositories/json_repository.dart';

/// Provider of Controller
final postControllerProvider = Provider((ref) {
  final jsonRepository = ref.watch(jsonRepositoryProvider);
  return PostController(jsonRepository: jsonRepository, ref: ref);
});

class PostController {
  final JsonRepository jsonRepository;
  final ProviderRef ref;

  PostController({
    required this.jsonRepository,
    required this.ref,
  });

  Future<List<Post>> getPosts() async {
    List<Post>? posts = await jsonRepository.getPosts();
    return posts;
  }
}

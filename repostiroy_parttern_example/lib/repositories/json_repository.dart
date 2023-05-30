// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../models/Post.dart';
import '../models/album.dart';

/// Provider to communicate with
final jsonRepositoryProvider = Provider(
  (ref) => JsonRepository(url: 'https://jsonplaceholder.typicode.com'),
);

// Define Repository
class JsonRepository {
  final String url;
  JsonRepository({
    required this.url,
  });

  Future<List<Album>> getAlbums() async {
    try {
      final response = await http.get(Uri.parse('$url/albums'));
      //
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Album> albums =
            data.map((item) => Album.fromMap(item)).toList();
        return albums;
      } else {
        throw Exception('Failed to load albums');
      }
    } catch (e) {
      throw Exception('Failed to fetch albums: $e');
    }
  }

  Future<List<Post>> getPosts() async {
    try {
      final response = await http.get(Uri.parse('$url/posts'));
      //
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Post> posts =
            data.map((item) => Post.fromMap(item)).toList();
        return posts;
      } else {
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      throw Exception('Failed to fetch posts: $e');
    }
  }
}

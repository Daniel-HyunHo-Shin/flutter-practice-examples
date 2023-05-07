import 'package:flutter/material.dart';
import 'package:tiktok_clone/data/mock_data.dart';
import 'package:tiktok_clone/widget/custom_list_tile.dart';

class DeckScreen extends StatelessWidget {
  const DeckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: ListView.builder(
            itemCount: MockData.newCards.length,
            itemBuilder: (context, index) => CustomListItem(
              thumbnail: const Icon(
                size: 200,
                Icons.video_collection,
              ),
              title: MockData.newCards[index],
              user: MockData.newCards[index],
              viewCount: MockData.number[index],
            ),
          ),
        ),
      ),
    );
  }
}

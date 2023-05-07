import 'package:flutter/material.dart';

class FeedItem extends StatefulWidget {
  const FeedItem({super.key});

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
  bool _isFlipped = false;

  void flipCard() {
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => flipCard(),
      child: Stack(
        children: [
          const SizedBox.expand(),
          if (_isFlipped)
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Fail'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Pass'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

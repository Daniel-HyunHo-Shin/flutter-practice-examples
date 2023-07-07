import 'package:flutter/material.dart';
import 'package:rest_api_example/common/const/colors.dart';

class RestaurantCard extends StatelessWidget {
  final Image image;
  final String name;
  final List<String> tag;
  final int ratingCount;
  final int deliveryTime;
  final int deliveryFee;
  final double rating;

  const RestaurantCard(
      {super.key,
      required this.image,
      required this.name,
      required this.tag,
      required this.ratingCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: image,
        ),
        const SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              tag.join(' · '),
              style: const TextStyle(
                color: bodyTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                _IconText(
                  icon: Icons.star,
                  label: rating.toString(),
                ),
                renderDot(),
                _IconText(
                  icon: Icons.receipt,
                  label: ratingCount.toString(),
                ),
                renderDot(),
                _IconText(
                  icon: Icons.timelapse_outlined,
                  label: '$deliveryTime 분',
                ),
                renderDot(),
                _IconText(
                  icon: Icons.monetization_on,
                  label: deliveryFee == 0 ? '무료' : '$deliveryFee 원',
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;
  const _IconText({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14.0, color: primaryColor),
        const SizedBox(
          width: 8,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12.0,
            color: bodyTextColor,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

Widget renderDot() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.0),
    child: Text(
      '·',
      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
    ),
  );
}

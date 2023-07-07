import 'package:flutter/material.dart';
import 'package:rest_api_example/restaurant/component/restaurant_card.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: RestaurantCard(
            image: Image.asset(
              'asset/img/food/ddeok_bok_gi.jpg',
              fit: BoxFit.cover,
            ),
            name: '불타는 떡볶이',
            tag: const ['떡뽁이', '치즈', '매운맛'],
            ratingCount: 100,
            deliveryTime: 15,
            deliveryFee: 2000,
            rating: 4.52),
      )),
    );
  }
}
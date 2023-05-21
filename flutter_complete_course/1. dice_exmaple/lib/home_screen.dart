import 'dart:math';
import 'package:flutter/material.dart';

var randomizer = Random();

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var randomDiceNumber = 1;

  void rollDice() {
    setState(() {
      randomDiceNumber = randomizer.nextInt(6) + 1;
    });
    print('diceNumber = $randomDiceNumber');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$randomDiceNumber',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: rollDice,
              child: const Text('Roll a dice'),
            ),
          ],
        ),
      ),
    );
  }
}

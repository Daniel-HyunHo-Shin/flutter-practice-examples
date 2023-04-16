import 'package:flutter/material.dart';

import '../widgets/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MyDrawer(
        // TODO: use firebase to fetch info
        name: 'HyunHo Shin',
        email: 'newshin8149@gmail.com',
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 26),
            child: Text(
              'Mastering Flutter 2023',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
        ],
      ),
    );
  }
}

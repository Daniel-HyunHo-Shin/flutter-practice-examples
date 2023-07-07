import 'package:flutter/material.dart';
import 'package:rest_api_example/common/const/colors.dart';
import 'package:rest_api_example/common/layout/default_layout.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  var index = 0;
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
    super.initState();
  }

  void tabListener() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(tabListener);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: primaryColor,
          unselectedItemColor: bodyTextColor,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              controller.animateTo(index);
            });
          },
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.fastfood_outlined,
              ),
              label: '음식',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_long_outlined,
              ),
              label: '주문',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outlined,
              ),
              label: '프로필',
            ),
          ]),
      child: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller,
          children: [
            Center(
              child: Container(
                child: const Text('홈'),
              ),
            ),
            Center(
              child: Container(
                child: const Text('음식'),
              ),
            ),
            Center(
              child: Container(
                child: const Text('주문'),
              ),
            ),
            Center(
              child: Container(
                child: const Text('프로필'),
              ),
            ),
          ]),
    );
  }
}

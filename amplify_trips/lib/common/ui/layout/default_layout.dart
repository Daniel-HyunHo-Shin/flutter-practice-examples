import 'package:flutter/material.dart';
import 'package:amplify_trips/common/utils/colors.dart' as constants;

class DefaultLayout extends StatelessWidget {
  final String? title;
  final Widget child;
  final Widget? floatingActionButton;

  const DefaultLayout(
      {required this.child, this.title, this.floatingActionButton, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    }

    return AppBar(
      centerTitle: true,
      title: Text(title!),
      backgroundColor: const Color(constants.primaryColorDark),
    );
  }
}

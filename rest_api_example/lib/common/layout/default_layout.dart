import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;

  const DefaultLayout(
      {super.key,
      required this.child,
      this.backgroundColor,
      this.title,
      this.bottomNavigationBar});

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(widget.title),
      backgroundColor: widget.backgroundColor ?? Colors.white,
      body: widget.child,
      bottomNavigationBar: widget.bottomNavigationBar,
    );
  }
}

AppBar? renderAppBar(String? title) {
  if (title == null) {
    return null;
  } else {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0.0,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<dynamic> showErrorDialog(BuildContext context, FirebaseAuthException e) {
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text("Error Occured"),
      content: Text(e.toString()),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("OK"))
      ],
    ),
  );
}

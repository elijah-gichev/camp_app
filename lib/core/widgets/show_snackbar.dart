import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
}) {
  //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

  Flushbar(
    title: "Внимание",
    message: message,
    backgroundGradient: const LinearGradient(colors: [Colors.blue, Colors.teal]),
    backgroundColor: Colors.red,
    boxShadows: const [
      BoxShadow(
        color: Colors.blue,
        offset: Offset(0.0, 2.0),
        blurRadius: 3.0,
      )
    ],
    duration: const Duration(seconds: 3),
  ).show(context);
}

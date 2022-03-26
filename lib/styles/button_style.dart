import 'package:flutter/material.dart';

class ButtonStyles {
  static final mainButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.orangeAccent),
    foregroundColor: MaterialStateProperty.all(Colors.deepOrange),
    elevation: MaterialStateProperty.all(15),
    side: MaterialStateProperty.all(
      const BorderSide(
        color: Colors.deepOrangeAccent,
        width: 2,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

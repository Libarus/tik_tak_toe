import 'package:flutter/material.dart';
import 'package:tik_tak_toe/styles/text_styles.dart';


class AppBarStyle{

  final String label;

  AppBarStyle({required this.label});

  final appBarStyle = AppBar(
    backgroundColor: Colors.orangeAccent,
    title: Text(/*label*/'',
      style: TextStyles.mainGameTextStyle,)
    );
}
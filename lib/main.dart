import 'package:flutter/material.dart';
import 'package:tik_tak_toe/text_styles.dart';
import 'package:tik_tak_toe/the_game_widget.dart';

void main() {
  runApp(const MainGame());
}

// Создали виджет, который будет являться обвязой для всего
// Так сказать внешним дизайном
class MainGame extends StatelessWidget {
  const MainGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // убирает debug из прав.верх угла
      home: Scaffold(
        backgroundColor: Colors.amberAccent,
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: const Text(
            'The Game',
            style: TextStyles.mainGameTextStyle,
          ),
        ),
        body: const TheGameWidget(), // см.внизу №1
      ),
    );
  }
}

/*
№1 Вызываем виджет, который и отвечает за внутреннюю игру. Это также нам
в дальнейшем позволит добавить маршрутизацию (роутинг) для добавления
других страниц, например, главное меню, инструкция, об игре и прочее.
*/
import 'package:flutter/material.dart';
import 'package:tik_tak_toe/styles/text_styles.dart';
import 'package:tik_tak_toe/widgets/options_widget.dart';
import 'package:tik_tak_toe/widgets/the_game_widget.dart';

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
        routes: {
          '/': (context) => const TheGameWidget(),
          '/options_widget': (context) =>
              const OptionsWidget(),
        });
  }
}
/*Начал избавляться от кода в файле main, хорошая практика его тут минимизировать
и использовать данный файл только, как точка запуска приложения*/

/*
№1 Вызываем виджет, который и отвечает за внутреннюю игру. Это также нам
в дальнейшем позволит добавить маршрутизацию (роутинг) для добавления
других страниц, например, главное меню, инструкция, об игре и прочее.
*/

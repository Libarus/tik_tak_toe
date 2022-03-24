import 'package:flutter/material.dart';
import 'package:tik_tak_toe/text_styles.dart';

import 'button_style.dart';
import 'field.dart';

// Конвертировал в стейтфул виджет для того, чтобы отслеживать
// текущий ход игрока и влиять из-за этого на всю игру

class TheGameWidget extends StatefulWidget {
  const TheGameWidget({Key? key}) : super(key: key);

  @override
  State<TheGameWidget> createState() => _TheGameWidgetState();
}

class _TheGameWidgetState extends State<TheGameWidget> {

  int player = 1; // 1 - игрок Х, 2 - игрок О
  List<int> field = List.generate(9, (index) => 0);

  void reset(){
    setState(() {fieldWidgets = List.generate(
      9,
          (index) => GridTile(
        child: InkWell(
          enableFeedback: true,
          child: FieldWidget(drawType: field[index]),
          onTap: () => _onTileClicked(index),
        ),
      ),
    );
    debugPrint('init state');

    @override
    Widget build(BuildContext context) {
      return Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: GridView.count(
            crossAxisCount: 3,
            children: fieldWidgets, // №2
          ),
        ),
      );
    }});}

  void _onTileClicked(int index) {
    debugPrint("You tapped on item $index  $widget.player");
    setState(() {
      // заносим в список текущего игрока
      field[index] = widget.player;

      // начало
      fieldWidgets = List.generate(
        9,
        (index) => GridTile(
          child: InkWell(
            enableFeedback: true,
            child: FieldWidget(drawType: field[index]),
            onTap: () => _onTileClicked(index),
          ),
        ),
      );
      // окончание, см.№1
      fieldWidgets[index] = FieldWidget(drawType: field[index]); // (*)

      widget.setStepPlayer(); // вызываем ф-ию, которую передали
      // доступ к переданным переменным осуществляется через widget.<...>
    });
  }

  List<Widget> fieldWidgets = List.generate(9, (index) => const Text('1'));

  @override
  void initState() {
    super.initState();
    // генерируем список из GridTile, чтобы можно было бы отслеживать
    // нажатия по ячейке сетки через InkWell
    // при тапе (onTap) вызываем _onTileClicked с индексом ячейки
    fieldWidgets = List.generate(
      9,
      (index) => GridTile(
        child: InkWell(
          enableFeedback: true,
          child: FieldWidget(drawType: field[index]),
          onTap: () => _onTileClicked(index),
        ),
      ),
    );
    debugPrint('init state');
  }

  // !! сделано, думаю, не оптимально
  // заводим статичный список стилей для надписи первого игрока
  // виджет будет применяться в зависимости от номера игрока
  // строка в коде - (1)
  static const List<TextStyle> stylePlayer1 = <TextStyle>[
    TextStyle(),
    TextStyles.playerOn,
    TextStyles.playerOff
  ];

  // для надписи второго игрока
  // строка в коде - (2)
  static const List<TextStyle> stylePlayer2 = <TextStyle>[
    TextStyle(),
    TextStyles.playerOff,
    TextStyles.playerOn
  ];

  // функция изменения состояния игрока
  void changePlayerStep() {
    setState(() {
      player++; // если был 1 станет 2, если был 2 станет 3
      if (player > 2) {
        // если больше 2, то снова 1
        // таким образом мы меняем игрока
        player = 1;
      }
      debugPrint("player $player"); // дебаг надпись
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        const Text(
          'Score: 1:1',
          style: TextStyles.mainGameTextStyle,
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            height: 300,
            width: 300,
            child: GridView.count(
              crossAxisCount: 3,
              children: fieldWidgets, // №2
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Игрок X',
                style: stylePlayer1[player], // (1)
              ),
              Text(
                'Игрок O',
                style: stylePlayer2[player], // (2)
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ButtonStyles.mainButtonStyle,
          child: const Text('RESET'),
          onPressed: () {},
        ),
      ],
    );
  }
}

/*
№1 передаём в виджет функцию, не вызываем её, а именно передаём, чтобы внутри
виджета её вызвать, а она уже обновила состояние этого виджета.

Это один из моментов всплытия событий и данных.
Мы же не можем напрямую вызвать ф-ию, но через ссылки мы можем таким
образом передавать данные из виджетов нижнего уровня (детей) в виджеты
верхнего уровны (родители).
*/

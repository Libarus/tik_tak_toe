import 'package:flutter/material.dart';
import 'package:tik_tak_toe/field.dart';

// виджет отображения игрового поля

class GameFieldWidget extends StatefulWidget {
  const GameFieldWidget({
    Key? key,
    required this.player, // входная переменна 1
    required this.setStepPlayer, // входная переменная 2
  }) : super(key: key);

  final int player; // тут создаём 1
  final Function setStepPlayer; // тут создаём 2

  @override
  _GameFieldWidgetState createState() => _GameFieldWidgetState();
}

class _GameFieldWidgetState extends State<GameFieldWidget> {
  // список состояний полей
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


  // ф-ия событие на нажатие на поле
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

  // список виджетов поля
  List<Widget> fieldWidgets = List.generate(9, (index) => const Text('1'));

  // ф-ия начальной инициализации состояний
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
  }
}

/*
№2 В идеале, можно было бы оставить строку (*), однако изменение внутри
списка одного элемента почему-то не отслеживается, чтобы перерисовать 
интерфейс, поэтому я пока ничего лучше не придумал, чем сначала
перегенерировать весь список (блок начало-окончание), а уже потом
изменяется только один элемент. И вот из-за этого и идёт перерисовка
интерфейса.



№2 Я переписал с использованием таблицы на сетку. У неё есть особенность
выводить список в ячейки слвева направо и по строчно сверху вниз.
Поэтому наверху я завёл две переменные типа лис, field - отвечает за 
сохранение текущего состояния ячейки, которые изменили игроки:
0 - пусто,
1 - первый игрок,
2 - второй игрок
fieldWidgest - список, который отвечает за хранение виджетов, которые 
будут отображаться
*/
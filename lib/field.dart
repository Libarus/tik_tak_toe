import 'package:flutter/material.dart';

// Отдельный виджет, который будет рисовать ячейку

class FieldWidget extends StatelessWidget {
  const FieldWidget({
    Key? key,
    required this.drawType,
  }) : super(key: key);

  final int drawType;

  // список виджетов, в зависимости от состояния
  // что рисуем? пусто, крести, нолик
  static const List<Widget> widgetIcons = <Widget>[
    Text(''),
    Icon(Icons.close, size: 100, color: Colors.blueAccent),
    Icon(Icons.circle_outlined, size: 100, color: Colors.redAccent),
  ];

  // BoxDecoration - виджет декорирования ячейки

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // было 100, поменял на double.infinity, что бы
      height: double.infinity, // блок занимал всё пространство
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        border: Border.all(color: Colors.black.withOpacity(0.2)),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 3,
              offset: const Offset(5, 5)),
        ],
      ),
      child: widgetIcons[drawType],
    );
  }
}

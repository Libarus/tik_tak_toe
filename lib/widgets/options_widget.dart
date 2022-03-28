import 'package:flutter/material.dart';
import 'package:tik_tak_toe/styles/button_style.dart';
import 'package:tik_tak_toe/styles/text_field_style.dart';
import 'package:tik_tak_toe/styles/text_styles.dart';

class OptionsWidget extends StatefulWidget {
  const OptionsWidget({Key? key}) : super(key: key);

  @override
  _OptionsWidgetState createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Options', //указал в конструкторе appbar_style поле title ,что бы не хардкодить, но не работает(
          style: TextStyles.mainGameTextStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: const [
                Text('Игрок 1'),
                SizedBox(width: 20),
                Flexible(
                  // Поискал. Оказывается просто так TextField в Row
                  // нельзя добавить. Только через Flixible или Expanded
                  child: TextField(
                    decoration: InputDecoration(
                        helperText: "Введите имя первого игрока"),
                  ),
                ),
              ],
            ),
            Row(
              children: const [
                Text('Игрок 2'),
                SizedBox(width: 20),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                        helperText: "Введите имя второго игрока"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                style: ButtonStyles.mainButtonStyle,
                child: const Text('OK'),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

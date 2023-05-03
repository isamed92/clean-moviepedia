import 'package:flutter/material.dart';

class GenderScreen extends StatelessWidget {
  static String name = 'genders';
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = <Color>[
      Colors.blue,
      Colors.red,
      Colors.pink,
      Colors.green,
      Colors.purple,
      Colors.cyan,
      Colors.indigo,
      Colors.lime,
      Colors.orange,
      Colors.teal,
    ];
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        return LimitedBox(
          maxHeight: 200,
          child: Container(
            color: colors[index],
          ),
        );
      },
    );
  }
}

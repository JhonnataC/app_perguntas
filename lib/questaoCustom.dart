import 'package:flutter/material.dart';

class QuestaoCustom extends StatelessWidget {
  final String texto;

  const QuestaoCustom({
    super.key,
    required this.texto,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 25,
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

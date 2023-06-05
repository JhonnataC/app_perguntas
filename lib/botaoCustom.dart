import 'package:flutter/material.dart';

class BotaoCustom extends StatelessWidget {
  final String texto;
  final Color? color;
  final void Function() onPressed;

  const BotaoCustom({
    super.key,
    required this.texto,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 150,
        height: 35,
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            texto,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        /*ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey,
          ),
          child: Text(
            texto,
            style: const TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),*/
      ),
    );
  }
}

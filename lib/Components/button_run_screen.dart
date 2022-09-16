import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonRunScreen extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final bool color;

  const ButtonRunScreen({
    required this.text,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        height: 55,
        width: 120,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color
                ? Color.fromRGBO(132, 202, 157, 1)
                : Color.fromRGBO(231, 71, 119, 0.7)),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            overflow: TextOverflow.visible,
            style: TextStyle(
                fontSize: 14,
                color: color
                    ? Colors.white
                    : Colors.white //Color.fromRGBO(132, 202, 157, 1),
                ),
          ),
          onPressed: onTap,
        ),
      ),
    );
  }
}

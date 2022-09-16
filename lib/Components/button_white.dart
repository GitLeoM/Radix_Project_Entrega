import 'package:flutter/material.dart';

import '../utils/app_routes.dart';

class ButtonWhite extends StatelessWidget {
  final String text;
  final void Function() onTap;
  final double height;
  final double width;
  final double fontSize;
  final bool color;

  const ButtonWhite(
      {required this.text,
      required this.onTap,
      required this.height,
      required this.width,
      this.fontSize = 15,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: height,
          width: width,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(color
                  ? const Color.fromRGBO(132, 202, 157, 1)
                  : Colors.white),
            ),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: fontSize,
                  color: color
                      ? Colors.white
                      : const Color.fromRGBO(132, 202, 157, 1),
                  fontWeight: FontWeight.w600),
            ),
            onPressed: onTap,
          ),
        ),
      ),
    );
  }
}

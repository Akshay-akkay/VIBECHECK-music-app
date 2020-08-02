import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class BigPageTitle extends StatelessWidget {
  final String titleString;
  const BigPageTitle({
    Key key,
    this.titleString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24),
      child: Text(
        titleString,
        // gradient: LinearGradient(
        //     colors: <Color>[Color(0xffEE0979), Color(0xffFF6A00)],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight),
        style: TextStyle(
          fontSize: 45,
          fontFamily: 'poppins',
          fontWeight: FontWeight.bold,
          foreground: Paint()
            ..shader = LinearGradient(
                    colors: <Color>[Color(0xffEE0979), Color(0xffFF6A00)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)
                .createShader(
              Rect.fromLTWH(0.0, 0.0, 400.0, 190.0),
            ),
        ),
      ),
    );
  }
}

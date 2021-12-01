import 'package:flutter/material.dart';

enum ButtonType2 { PRIMARY, PLAIN }

class Button extends StatelessWidget {
  final ButtonType2? type;
  final VoidCallback? onPressed;
  final String? text;

  Button({this.type, this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        width: 300,
        height: 45,
        decoration: BoxDecoration(
          color: getButtonColor(context, type!),
          borderRadius: BorderRadius.circular(4.0),
          boxShadow: [
            BoxShadow(
                //color: Color.fromRGBO(169, 176, 185, 0.42),
                //spreadRadius: 0,
                //blurRadius: 3.0,
                //offset: Offset(0, 2),
                )
          ],
        ),
        child: Center(
          child: Text(this.text!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: getTextColor(context, type!))),
        ),
      ),
    );
  }
}

Color getButtonColor(context, ButtonType2 type) {
  switch (type) {
    case ButtonType2.PRIMARY:
      return Theme.of(context).buttonColor;
    case ButtonType2.PLAIN:
      return Colors.white;
    default:
      return Theme.of(context).primaryColor;
  }
}

Color getTextColor(context, ButtonType2 type) {
  switch (type) {
    case ButtonType2.PLAIN:
      return Theme.of(context).primaryColor;
    case ButtonType2.PRIMARY:
      return Colors.white;
    default:
      return Theme.of(context).buttonColor;
  }
}

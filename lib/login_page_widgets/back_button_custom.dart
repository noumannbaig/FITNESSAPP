import 'package:flutter/material.dart';

class BackButtonCustom extends StatelessWidget {
  final Color arrowColor;
  final Color arrowBackgroundColor;
  final VoidCallback buttonHandler;
  final String tip;
  final IconData icon;

  const BackButtonCustom({
    Key? key,
    required this.arrowColor,
    required this.arrowBackgroundColor,
    required this.buttonHandler,
    required this.tip,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: arrowBackgroundColor, // Button color
        child: InkWell(
          splashColor: Colors.red, // Splash color
          onTap: buttonHandler,
          child: SizedBox(
            width: 50,
            height: 50,
            child: Icon(
              icon,
              color: arrowColor,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

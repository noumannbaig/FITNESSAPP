import 'package:flutter/material.dart';

import './back_button_custom.dart';

class Heading extends StatelessWidget {
  final String topText;
  final VoidCallback backButtonPressed;
  final Color arrowBackgroundColor;
  final bool renderBackButton;

  const Heading({
    Key? key,
    required this.topText,
    required this.backButtonPressed,
    required this.arrowBackgroundColor,
    required this.renderBackButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 1,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.05,
        bottom: MediaQuery.of(context).size.height * 0.02,
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          // if (renderBackButton)
          //   BackButtonCustom(
          //     arrowBackgroundColor: arrowBackgroundColor,
          //     arrowColor: Theme.of(context).backgroundColor,
          //     tip: 'Back Button',
          //     buttonHandler: backButtonPressed,
          //     icon: Icons.arrow_back,
          //   ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          Expanded(
            child: Text(
              topText,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}

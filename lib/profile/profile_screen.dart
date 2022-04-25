import 'package:flutter/material.dart';

import 'components/body.dart';
import '../components/signup_background.dart';
class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Profile',
      //     style: TextStyle(
      //       fontFamily: 'Pacifico',
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
          child: Body(),
         )
         )
         )
          );
        
  }
}

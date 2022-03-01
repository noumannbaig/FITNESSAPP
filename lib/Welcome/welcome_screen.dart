import 'package:flutter/material.dart';
import 'components/background.dart';
import 'package:circle_main/components/rounded_button.dart';
import 'package:circle_main/components/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:circle_main/login_pages/sign_in_page.dart';
import 'package:circle_main/login_pages/sign_up_page.dart';
import 'package:provider/provider.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({ Key ?key }) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
   @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME TO FitKit",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset('assets/main.svg',
            width: size.width*0.5,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              color: Colors.purple,
              text: "LOGIN",
              press: ()=> {
                 Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return ListenableProvider(
                                    create: (context) => animation,
                                    child: const LoginPage(),
                                  );
                                },
                                transitionDuration: const Duration(
                                  seconds: 2,
                                ),
                              ),
                )
                
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: ()=> {
                Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return ListenableProvider(
                                    create: (context) => animation,
                                    child: const SignUpPage(),
                                  );
                                },
                                transitionDuration: const Duration(
                                  seconds: 2,
                                ),
                              ),
                            )
              },
            ),
          ],
        ),
      ),
    ),
      ),
      );
  }
}
    


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../utils/google_authentication.dart';
import '../login_pages/sign_in_page.dart';
import '../models/user_models.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  Route _routeToSignInScreen() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(-1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
  }

  bool _isSigningIn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.03,
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).primaryColorLight),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                User? user = await GoogleAuthentication.signInWithGoogle(
                    context: context);

                setState(() {
                  _isSigningIn = false;
                });

                if (user != null) {
                  final _auth = FirebaseAuth.instance;

                  FirebaseFirestore firebaseFirestore =
                      FirebaseFirestore.instance;

                  User user = _auth.currentUser as User;

                  User_ userModel = User_();

                  userModel.id = user.uid;
                  userModel.name = user.displayName;
                  userModel.email = user.email;
                  userModel.phonenumber = user.phoneNumber;
                  userModel.photoUrl = user.photoURL;
                  userModel.gender = 'Other';

                  await firebaseFirestore
                      .collection("Users")
                      .doc(user.uid.toString())
                      .collection('Personal Information')
                      .doc(user.uid.toString())
                      .set(userModel.toMap());
                  Fluttertoast.showToast(
                      msg: "Account created successfully :) ");

                  Navigator.of(context).pushReplacement(_routeToSignInScreen());
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 35.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 18,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../login_page_widgets/back_button_custom.dart';
import '../login_page_widgets/text_field_custom.dart';
import '../login_page_widgets/heading.dart';
import '../login_page_widgets/google_sign_in.dart';
import '../login_page_widgets/sliding_container.dart';
import '../login_pages/sign_in_page.dart';
import '../components/signup_background.dart';
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordPage> {
  TextEditingController emailHandler = TextEditingController();
  TextEditingController passwordHandler = TextEditingController();
  TextEditingController confirmPasswordHandler = TextEditingController();

  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  void handleEmail() {}

  void handlePassword() {}
  void handleConfirmPassword() {}
  void handleForgetButtonPressed() {
    final isValid = _form.currentState?.validate();
    if (isValid == null || !isValid) {
      return;
    } else {
      Resetlink();
    }
    //signIn(emailHandler.text, passwordHandler.text);
  }

  void backButtonPressed() {
    Navigator.of(context).pop();
  }

  String? emailValidator(String? email) {
    String patttern = r"[a-zA-Z_][a-zA-Z0-9_.]*[@][a-zA-Z]+[.]com$";
    RegExp regExp = RegExp(patttern);
    if (email == null || email.isEmpty) {
      return 'This field is required';
    }
    if (!regExp.hasMatch(email)) {
      return 'Please enter valid email!';
    }
    return null;
  }

  String? passwordValidator(String? pass) {
    if (pass == null || pass.isEmpty) {
      return 'This field is required';
    } else if (pass.trim().length < 6) {
      return 'Password must be at least 6 characters in length - No White Spaces';
    }
    return null;
  }

  String? confirmPassValidator(String? pass) {
    if (pass == null || pass.isEmpty) {
      return 'This field is required';
    }
    if (passwordHandler.text != confirmPasswordHandler.text) {
      return "Password doesn't match!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Background(
          child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(0),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SlidingContainer(
                  initialOffsetX: 1,
                  intervalStart: 0.5,
                  intervalEnd: 1,
                  wid: Heading(
                    topText: 'Reset Password!',
                    backButtonPressed: backButtonPressed,
                    arrowBackgroundColor: Colors.blue,
                    renderBackButton: true,
                  ),
                ),
                SlidingContainer(
                  initialOffsetX: -1,
                  intervalStart: 0,
                  intervalEnd: 0.5,
                  wid: PhysicalModel(
                    color: Colors.black,
                    elevation: 15,
                    borderRadius: BorderRadius.circular(15),
                    child: Form(
                      key: _form,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.57,
                        width: MediaQuery.of(context).size.width * 0.90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.purple.shade700,
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                bottom: 5,
                              ),
                              child: Text(
                                'Reset Link will be sent to your entered Email Address',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    ?.copyWith(
                                      fontSize: 35,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            TextFieldCustom(
                              hintPlace: 'Enter Email',
                              type: TextInputType.text,
                              labelText: 'Email',
                              textHandler: emailHandler,
                              maxCharacters: 255,
                              submitHandler: handleEmail,
                              isPasswordFeild: false,
                              fieldValidator: emailValidator,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.04,
                            ),
                            BackButtonCustom(
                              arrowColor: Colors.blue,
                              arrowBackgroundColor: Colors.white,
                              buttonHandler: handleForgetButtonPressed,
                              tip: 'Login',
                              icon: Icons.arrow_forward,
                            ),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.001,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SlidingContainer(
                    initialOffsetX: 1,
                    intervalStart: 0.5,
                    intervalEnd: 1,
                    wid: Container(
                      padding: const EdgeInsets.all(2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          GoogleSignInButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void Resetlink() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailHandler.text);
      //  ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(backgroundColor: Colors.orange, content: Text('Password reset email has been sent !',
      //   style: TextStyle(fontSize: 18.0),),),
      //);
      Fluttertoast.showToast(msg: 'Reset Link Has been sent to you email');
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return ListenableProvider(
              create: (context) => animation,
              child: const LoginPage(),
            );
          },
          transitionDuration: const Duration(
            seconds: 2,
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for this email');

        Fluttertoast.showToast(msg: 'No user found for this email');
      }
    }
  }
}

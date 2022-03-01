import 'package:circle_main/login_pages/sign_up_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../login_page_widgets/back_button_custom.dart';
import '../login_page_widgets/text_field_custom.dart';
import '../models/user_models.dart';
import '../login_page_widgets/heading.dart';
import '../login_page_widgets/google_sign_in.dart';
import '../login_page_widgets/sliding_container.dart';
import 'forget_password.dart';
import '../components/rounded_button.dart';
import '../components/login_background.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailHandler = TextEditingController();
  TextEditingController passwordHandler = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String? errorMessage;
  void handleEmail() {}

  void handlePassword() {}

  void handleLoginButtonPressed() {
    final isValid = _form.currentState?.validate();
    if (isValid == null || !isValid) {
      return;
    }
    signIn(emailHandler.text, passwordHandler.text);
  }

  void backButtonPressed() {
    Navigator.of(context).pop();
  }

  String? usernameValidator(String? username) {
    String patttern = r"[_a-zA-Z][a-zA-Z_.0-9]*$";
    RegExp regExp = RegExp(patttern);
    if (username == null || username.isEmpty || username.trim().isEmpty) {
      return 'This field is required';
    } else if (!regExp.hasMatch(username)) {
      return 'Please enter valid name';
    } else if (username.length < 6) {
      return 'Username must be atleast 6 characthers in length';
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Background(child: 
        SingleChildScrollView(
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
                    topText: 'FitKit!',
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
                                'Sign In',
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
                              type: TextInputType.emailAddress,
                              labelText: 'Email',
                              textHandler: emailHandler,
                              maxCharacters: 255,
                              submitHandler: handleEmail,
                              isPasswordFeild: false,
                              fieldValidator: usernameValidator,
                            ),
                            TextFieldCustom(
                              hintPlace: 'Enter password',
                              type: TextInputType.text,
                              labelText: 'Password',
                              textHandler: passwordHandler,
                              maxCharacters: 255,
                              submitHandler: handlePassword,
                              isPasswordFeild: true,
                              fieldValidator: passwordValidator,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.only(
                                top: 3,
                                bottom: 10,
                                left: 10,
                                right: 10,
                              ),
                              padding: const EdgeInsets.all(3),
                              child: GestureDetector(
                                child: const Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) {
                                        return ListenableProvider(
                                          create: (context) => animation,
                                          child: const ForgetPasswordPage(),
                                        );
                                      },
                                      transitionDuration: const Duration(
                                        seconds: 2,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            // SizedBox(
                            //   height: MediaQuery.of(context).size.width * 0.008,
                            // ),
                            // BackButtonCustom(
                            //   arrowColor: Colors.blue,
                            //   arrowBackgroundColor: Colors.white,
                            //   buttonHandler: handleLoginButtonPressed,
                            //   tip: 'Login',
                            //   icon: Icons.arrow_forward,
                            // ),
                            RoundedButton(
                              color: Colors.purple,
                              text: 'Login', 
                              press: (){
                               handleLoginButtonPressed();
                              }),
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

  Future getUserData(UserCredential uid) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    await firebaseFirestore
        .collection("Users")
        .doc(uid.user?.uid.toString())
        .collection('Personal Information')
        .doc(uid.user?.uid.toString())
        .get()
        .then((value) {
      currentUser_ = User_.fromDocument(value, uid.user?.uid.toString());
    });
  }

  void signIn(String email, String password) async {
    if (_form.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) async {
          await getUserData(uid);
          Fluttertoast.showToast(msg: "Login Successful");

          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return ListenableProvider(
                  create: (context) => animation,
                  child: const SignUpPage(), //add Main Page screen to here
                );
              },
              transitionDuration: const Duration(
                seconds: 2,
              ),
            ),
          );
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
      }
    }
  }
}

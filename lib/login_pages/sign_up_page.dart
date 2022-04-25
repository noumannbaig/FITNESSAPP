import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../login_page_widgets/pin_widget.dart';
import '../login_page_widgets/back_button_custom.dart';
import '../login_page_widgets/heading.dart';
import '../login_page_widgets/google_sign_in.dart';
import '../login_page_widgets/basic_sign_up.dart';
import '../login_page_widgets/age_gender.dart';
import '../login_page_widgets/password_fields.dart';
import '../login_page_widgets/sliding_container.dart';
import '../login_pages/sign_in_page.dart';
import '../models/user_models.dart';
import '../components/signup_background.dart';
import '../components/rounded_button.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameHandler = TextEditingController();
  TextEditingController emailHandler = TextEditingController();
  TextEditingController phoneHandler = TextEditingController();
  TextEditingController passwordHandler = TextEditingController();
  TextEditingController confirmPasswordHandler = TextEditingController();
  TextEditingController usernameHandler = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  int selectedGender = 0;

  void changeGender(int gen) {
    selectedGender = gen;
  }

  // string for displaying the error Message
  String? errorMessage;
  String otpVal = '';
  DateTime selectedDate = DateTime.now();
  EmailAuth myAuth = EmailAuth(sessionName: 'test sesssion');
  void setOtpVal(String val) {
    otpVal = val;
  }

  int filledFormCounter = 0;

  void changeDate(DateTime picked) {
    if (picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void handleName() {}

  void handleEmail() {}

  void handlePhoneNumber() {}

  void handleUsername() {}

  void handleSignUpButtonPressed() {
    final isValid = _form.currentState?.validate();
    if (isValid == null || !isValid) {
      return;
    }
    // if (filledFormCounter == 0) {
    //   basicWid = AgeGender(
    //       selectedDate: selectedDate,
    //       changeDate: changeDate,
    //       changeGender: changeGender);
    //   filledFormCounter++;}
    if (filledFormCounter == 0) {
      basicWid = PasswordFields(
        passwordHandler: passwordHandler,
        confirmPasswordHandler: confirmPasswordHandler,
        handleConfirmPassword: handleConfirmPassword,
        handlePassword: handlePassword,
        handleUsername: handleUsername,
        usernameHandler: usernameHandler,
      );
      filledFormCounter++;
    } else if (filledFormCounter == 1) {
      basicWid = PinWidget(
        verifEmail: emailHandler.text,
        myAuth: myAuth,
        setOtpVal: setOtpVal,
      );

      filledFormCounter++;
    } else if (filledFormCounter == 2) {
      var res =
          myAuth.validateOtp(recipientMail: emailHandler.text, userOtp: otpVal);
      if (!res) {
        var snackBar =
            const SnackBar(content: Text('Failed to verify the account'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }

      basicWid = Container(
        alignment: Alignment.center,
        child: Text(
          'Succesfully Registered',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4?.copyWith(
                fontSize: 35,
                fontWeight: FontWeight.w500,
              ),
        ),
      );

      filledFormCounter++;
      signUp(emailHandler.text, passwordHandler.text);
    } else if (filledFormCounter == 3) {
      Navigator.of(context).pop();
    } else {}

    setState(() {});
  }

  void backButtonPressed() {
    Navigator.of(context).pop();
  }

  void handlePassword() {}
  void handleConfirmPassword() {}

  late Widget basicWid;

  @override
  void initState() {
    super.initState();
    basicWid = BasicSignUp(
      nameHandler: nameHandler,
      emailHandler: emailHandler,
      phoneHandler: phoneHandler,
      passwordHandler: passwordHandler,
      handleEmail: handleEmail,
      handleName: handleName,
      handlePhoneNumber: handlePhoneNumber,
      handlePassword: handlePassword,
    );
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
                  initialOffsetX: -1,
                  intervalStart: 0.5,
                  intervalEnd: 1,
                  wid: Heading(
                    topText: 'FitKit!',
                    backButtonPressed: backButtonPressed,
                    arrowBackgroundColor: Colors.purple.shade700,
                    renderBackButton: true,
                  ),
                ),
                SlidingContainer(
                  
                  initialOffsetX: 1,
                  intervalStart: 0,
                  intervalEnd: 0.5,
                  wid: PhysicalModel(
                    color: Colors.black,
                    elevation: 15,
                    borderRadius: BorderRadius.circular(15),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.39,
                            width: double.infinity,
                            margin: const EdgeInsets.all(3),
                            child: Form(
                              key: _form,
                              child: AnimatedSwitcher(
                                duration: const Duration(seconds: 2),
                                child: basicWid,
                                transitionBuilder: (
                                  child,
                                  animation,
                                ) {
                                  return AnimatedBuilder(
                                    animation: animation,
                                    builder: (context, child) {
                                      return SlideTransition(
                                        position: Tween<Offset>(
                                          begin: Offset(
                                              filledFormCounter % 2 == 0
                                                  ? -1
                                                  : 1,
                                              0),
                                          end: const Offset(0, 0),
                                        ).animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: const Interval(
                                              0,
                                              1,
                                              curve: Curves.elasticInOut,
                                            ),
                                          ),
                                        ),
                                        child: child,
                                      );
                                    },
                                    child: child,
                                  );
                                },
                              ),
                            ),
                          ),
                          // BackButtonCustom(
                          //   arrowColor: Colors.blue.shade700,
                          //   arrowBackgroundColor: Colors.white,
                          //   buttonHandler: handleSignUpButtonPressed,
                          //   tip: 'Next',
                          //   icon: Icons.arrow_forward,
                          // ),
                          RoundedButton(
                            text: 'SignUp', 
                            press: (){
                              handleSignUpButtonPressed();
                              },
                             color: Colors.purple.shade200)
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SlidingContainer(
                    initialOffsetX: -1,
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

  void signUp(String email, String password) async {
    if (_form.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(
                email: email.trim(), password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
        print(error.code);
        Navigator.of(context).pop();
      }
    }
  }

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
      },
    );
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    User user = _auth.currentUser as User;

    // User_? user = _auth.currentUser as User_?;

    User_ userModel = User_();

    // writing all the values

    userModel.id = user.uid;
    userModel.name = nameHandler.text.trim();
    userModel.email = emailHandler.text.trim();
    userModel.phonenumber = phoneHandler.text.trim();
    userModel.dateTime = selectedDate.toString();
    userModel.photoUrl = 'assets/dummy_pic.png';
    if (selectedGender == 0) {
      userModel.gender = 'Male';
    } else if (selectedGender == 1) {
      userModel.gender = 'Female';
    } else if (selectedGender == 2) {
      userModel.gender = 'Other';
    }

    await firebaseFirestore
        .collection("Users")
        .doc(user.uid.toString())
        .collection('Personal Information')
        .doc(user.uid.toString())
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.of(context).pushReplacement(_routeToSignInScreen());
  }
}

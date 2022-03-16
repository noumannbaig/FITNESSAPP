import 'package:FITKITAPP/utils/google_authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_pages/sign_in_page.dart';
import '../login_pages/sign_up_page.dart';
import '../login_page_widgets/main_page_body.dart';
import '../login_page_widgets/heading.dart';
import '../login_page_widgets/google_sign_in.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(0),
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Heading(
                    topText: "Circle",
                    backButtonPressed: () {},
                    arrowBackgroundColor: Colors.red,
                    renderBackButton: false,
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    height: MediaQuery.of(context).size.height * 0.57,
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainPageBody(
                          blockColor: Theme.of(context).primaryColorDark,
                          headText: 'Sign Up',
                          bottomText:
                              'Register with Circle and start connecting with your friends!',
                          midText: 'New to cirlce?',
                          heightMultiple: 0.55,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                          edge: const EdgeInsets.only(
                            right: 20,
                            top: 20,
                            left: 20,
                          ),
                          alignment: CrossAxisAlignment.end,
                          textAlign: TextAlign.end,
                          onTap: () {
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
                            );
                          },
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.1,
                        // ),
                        MainPageBody(
                          blockColor: Theme.of(context).primaryColorLight,
                          headText: 'Sign in',
                          bottomText:
                              'Login to see what your friends are upto!',
                          midText: 'Already have an account?',
                          heightMultiple: 0.48,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                          edge: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          alignment: CrossAxisAlignment.start,
                          textAlign: TextAlign.start,
                          onTap: () {
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.all(2),
                  //   margin: const EdgeInsets.all(5),
                  //   height: MediaQuery.of(context).size.height * 0.15,
                  //   child: const GoogleSignInButton(),
                  // ),
                  FutureBuilder(
                    future: GoogleAuthentication.initializeFirebase(
                        context: context),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Error initializing Firebase');
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                GoogleSignInButton(),
                              ],
                            ),
                          ),
                        );
                      }
                      return const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.orange,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

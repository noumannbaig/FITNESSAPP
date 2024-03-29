import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

String? userName;
String? email;
String? imageUrl;

class GoogleAuthentication {
  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
      ),
    );
  }

  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // User? user = FirebaseAuth.instance.currentUser;

    // if (user != null) {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (context) =>\
    //           HomePage(
    //         user: user,
    //       ),
    //     ),
    //   );
    // }

    return firebaseApp;
  }

  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;

        assert(user!.email != null);
        assert(user!.displayName != null);
        assert(user!.photoURL != null);

        userName = user!.displayName;
        email = user.email;
        imageUrl = user.photoURL;

        final User currentUser = await auth.currentUser!;
        assert(user.uid == currentUser.uid);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            GoogleAuthentication.customSnackBar(
              content:
                  'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            GoogleAuthentication.customSnackBar(
              content: 'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        print(e.toString());
      }
    }

    return user;
  }

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        GoogleAuthentication.customSnackBar(
          content: 'Error signing out. Try again.',
        ),
      );
    }
  }
}

// class GoogleAuthentication {
//   static SnackBar customSnackBar({required String content}) {
//     return SnackBar(
//       backgroundColor: Colors.black,
//       content: Text(
//         content,
//         style: const TextStyle(color: Colors.redAccent, letterSpacing: 0.5),
//       ),
//     );
//   }

//   static Future<FirebaseApp> initializeFirebase({
//     required BuildContext context,
//   }) async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();

//     User? user = FirebaseAuth.instance.currentUser;

//     if (user != null) {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => // const MainPage()
//               HomePage(
//             user: user,
//           ),
//         ),
//       );
//     }

//     return firebaseApp;
//   }

//   // static Future<User?> signInWithGoogle({required BuildContext context}) async {
//   //   // String? userName;
//   //   // String? email;
//   //   // String? imageUrl;

//   //   FirebaseAuth _auth = FirebaseAuth.instance;
//   //   User? user;

//   //   final GoogleSignIn googleSignIn = GoogleSignIn();

//   //   final GoogleSignInAccount? googleSignInAccount =
//   //       await googleSignIn.signIn();

//   //   if (googleSignInAccount != null) {
//   //     final GoogleSignInAuthentication googleSignInAuthentication =
//   //         await googleSignInAccount.authentication;

//   //     final AuthCredential credential = GoogleAuthProvider.credential(
//   //       accessToken: googleSignInAuthentication.accessToken,
//   //       idToken: googleSignInAuthentication.idToken,
//   //     );

//   //     try {
//   //       final UserCredential userCredential =
//   //           await _auth.signInWithCredential(credential);
//   //       user = userCredential.user;

//   //       // assert(user!.email != null);
//   //       // assert(user!.displayName != null);
//   //       // assert(user!.photoURL != null);

//   //       // userName = user!.displayName;
//   //       // email = user.email;
//   //       // imageUrl = user.photoURL;

//   //       // final User? currentUser = _auth.currentUser;
//   //       // assert(user.uid == currentUser!.uid);
//   //     } on FirebaseAuthException catch (e) {
//   //       if (e.code == 'account-exists-with-different-credential') {
//   //         ScaffoldMessenger.of(context).showSnackBar(
//   //           GoogleAuthentication.customSnackBar(
//   //             content:
//   //                 'The account already exists with a different credential.',
//   //           ),
//   //         );
//   //       } else if (e.code == 'invalid-credential') {
//   //         ScaffoldMessenger.of(context).showSnackBar(
//   //           GoogleAuthentication.customSnackBar(
//   //             content: 'Error occurred while accessing credentials. Try again.',
//   //           ),
//   //         );
//   //       }
//   //     } catch (e) {
//   //       print(e.toString());
//   //     }
//   //   }

//   //   return user;
//   // }

//   static Future<void> signOut({required BuildContext context}) async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();

//     try {
//       if (!kIsWeb) {
//         await googleSignIn.signOut();
//       }
//       await FirebaseAuth.instance.signOut();
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         GoogleAuthentication.customSnackBar(
//           content: 'Error signing out. Try again.',
//         ),
//       );
//     }
//   }
// }

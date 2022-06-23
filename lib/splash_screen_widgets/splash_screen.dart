// import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'dart:async';
// import 'arc_painter.dart';
// import 'package:FITKITAPP/Welcome/welcome_screen.dart';
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   late Animation<double> animation1, animation2;
//   late AnimationController controller1, controller2;

//   @override
//   void initState() {
//     controller1 = AnimationController(
//         duration: const Duration(milliseconds: 2200), vsync: this);

//     controller2 = AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);

//     animation1 = Tween<double>(begin: 0.0, end: 1.0)
//         .animate(CurvedAnimation(parent: controller2, curve: Curves.linear));

//     animation2 = ReverseAnimation(Tween<double>(begin: -0.05, end: 1.0)
//         .animate(CurvedAnimation(parent: controller2, curve: Curves.linear)));

//     controller1.repeat();
//     controller2.repeat();
//     super.initState();
//     Timer(const Duration(seconds: 3), route);
//   }

//   @override
//   void dispose() {
//     controller1.dispose();
//     controller2.dispose();
//     super.dispose();
//   }

//   route() {
//     Navigator.pushReplacement(
//         context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Stack(children: <Widget>[
//           Center(
//             child: RotationTransition(
//               turns: animation1,
//               child: CustomPaint(
//                 painter: ArcPainter(
//                     color: const Color.fromRGBO(66, 120, 189, 1),
//                     iconsSize: 14),
//                 child: const SizedBox(
//                   width: 0.85 * 180,
//                   height: 0.85 * 180,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: RotationTransition(
//               turns: animation2,
//               child: CustomPaint(
//                 painter: ArcPainter(
//                     color: const Color.fromRGBO(13, 152, 186, 1),
//                     iconsSize: 20),
//                 child: const SizedBox(
//                   width: 170,
//                   height: 170,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.only(left: 14.0),
//               child: AnimatedTextKit(
//                 animatedTexts: [
//                   TypewriterAnimatedText(
//                     'FitKit',
//                     textStyle: Theme.of(context).textTheme.headline3,
//                   ),
//                 ],
//                 totalRepeatCount: 4,
//                 pause: const Duration(milliseconds: 5000),
//                 displayFullTextOnTap: true,
//                 stopPauseOnTap: true,
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';

import '../Welcome/welcome_screen.dart';
import '../login_pages/main_page.dart';
import 'arc_painter.dart';
import 'package:FitKitApp2/Welcome/welcome_screen.dart';
class SplashScreen extends StatefulWidget {
void main() {
  runApp(SplashScreen());
}


  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => WelcomeScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: new Color(0xffF5591F),
                gradient: LinearGradient(colors: [( Colors.purple), Colors.purple.shade800],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                )
            ),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/splash.png"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(140),
            child: Text('Fitkit',
              style: 
                Theme.of(context).textTheme.headline2,
              ),
              ),
          
        ],
      ),
    );
  }
}

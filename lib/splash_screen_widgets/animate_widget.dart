import 'package:flutter/material.dart';
import '../login_pages/sign_in_page.dart';
import '../login_pages/sign_up_page.dart';

class AnimateWidget extends StatefulWidget {
  @override
  _AnimateWidgetState createState() => _AnimateWidgetState();
}

class _AnimateWidgetState extends State<AnimateWidget>
    with SingleTickerProviderStateMixin {
  final double maxSlide = 250.0;

  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    super.initState();
  }

  void toggle() {
    animationController.isDismissed
        ? animationController.forward()
        : animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: toggle,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Stack(children: <Widget>[
              LoginPage(),
              Transform.translate(
                offset: Offset(maxSlide * (animationController.value - 1), 0),
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateY(
                        3.14159265359 / 2 * (1 - animationController.value)),
                  alignment: Alignment.centerRight,
                  child: SignUpPage(),
                ),
              ),
            ]);
          },
        ),
      ),
    );
  }
}

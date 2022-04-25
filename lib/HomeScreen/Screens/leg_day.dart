import '../panels/panel.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class LegDay extends StatefulWidget {
  const LegDay({Key? key}) : super(key: key);

  @override
  _LegDayState createState() => _LegDayState();
}

class _LegDayState extends State<LegDay> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Leg day',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          splashColor: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SlidingUpPanel(
        minHeight: MediaQuery.of(context).size.height * 0.35,
        maxHeight: MediaQuery.of(context).size.height * 0.80,
        parallaxEnabled: true,
        parallaxOffset: .5,
        body: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/legbg.jpg'), 
                  fit: BoxFit.fill)),
        ),
        panelBuilder: (controller) => PanelWidget(
          controller: controller,
        ),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
      ),
    );
  }
}

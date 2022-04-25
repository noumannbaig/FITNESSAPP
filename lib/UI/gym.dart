import 'package:flutter/material.dart';
import '../UI/contact_us.dart';

class GymPage extends StatefulWidget {
  const GymPage({Key? key}) : super(key: key);

  @override
  GymScreen createState() {
    return GymScreen();
  }
}

class GymScreen extends State<GymPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('GYM',
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ],
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    child: const Icon(Icons.feedback_rounded , color: Colors.black,),
                    onTap: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUs()),
                    );
                    },
                  ),
                ),
              ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white70,
          ),
        ));
  }
}

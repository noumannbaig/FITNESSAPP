import 'package:flutter/material.dart';
import '../UI/Exerciseplan.dart';

class ShowExercisePlansPage extends StatefulWidget {
  const ShowExercisePlansPage({ Key? key }) : super(key: key);

  @override
  _ShowExercisePlansPageState createState() => _ShowExercisePlansPageState();
}

class _ShowExercisePlansPageState extends State<ShowExercisePlansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Exercise Plans',
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
                  child: const Icon(
                    Icons.feedback_rounded,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ExercisePage()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        body: Container(

        ),
    );
  }
}

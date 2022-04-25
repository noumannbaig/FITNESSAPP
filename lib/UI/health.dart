import 'package:flutter/material.dart';
import '../UI/deitplan.dart';
import '../UI/Exerciseplan.dart';
import '../UI/nutrition.dart';
import '../UI/gym.dart';

class HealthScreen extends StatefulWidget {
  const HealthScreen({Key? key}) : super(key: key);

  @override
  _HealthScreenState createState() => _HealthScreenState();
}

class _HealthScreenState extends State<HealthScreen> {
  get children => null;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: height * 0.3,
              child: Card(
                color: Colors.white54,
                child: const Center(child: Text("Daily Target Progress")),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 5,
                margin: const EdgeInsets.all(10),
              )),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DeitPlans()),
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Stack(
                    children: [
                      Container(
                          height: height * 0.25,
                          width: width * 0.5,
                          child: Card(
                            color: Colors.white54,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                'assets/dietPlans.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                          )),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              color: Colors.black54,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Diet Plans',
                                  style:
                                      TextStyle(fontSize: 25, color: Colors.white),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExercisePage()),
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Stack(
                    children: [
                      Container(
                          height: height * 0.25,
                          width: width * 0.5,
                          child: Card(
                            color: Colors.white54,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                'assets/exercise.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                          )),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              color: Colors.black54,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Exercise Plans',
                                  style:
                                      TextStyle(fontSize: 25, color: Colors.white),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GymPage()),
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Stack(
                    children: [
                      Container(
                          height: height * 0.25,
                          width: width * 0.5,
                          child: Card(
                            color: Colors.white54,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                'assets/gym.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                          )),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              color: Colors.black54,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Gym',
                                  style:
                                      TextStyle(fontSize: 25, color: Colors.white),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NutritionPage()),
                  );
                },
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Stack(
                    children: [
                      Container(
                          height: height * 0.25,
                          width: width * 0.5,
                          child: Card(
                            color: Colors.white54,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                'assets/nutrition.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                          )),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              color: Colors.black54,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Nutrition',
                                  style:
                                      TextStyle(fontSize: 25, color: Colors.white),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

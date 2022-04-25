
import '../Screens/result.dart';
import '../Screens/leg_day.dart';
import '../Screens/arm_day.dart';
import 'package:flutter/material.dart';

class FeaturedWorkouts extends StatefulWidget {
  const FeaturedWorkouts({Key? key}) : super(key: key);

  @override
  _FeaturedWorkoutsState createState() => _FeaturedWorkoutsState();
}

Container swipers(String imageVal) {
  return Container(
    width: 230,
    margin: const EdgeInsets.only(
      top: 7,
      right: 17,
    ),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: Colors.purple,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 2,
            blurRadius: 7,
          )
        ],
        image: DecorationImage(image: AssetImage(imageVal), fit: BoxFit.cover)),
  );
}

class _FeaturedWorkoutsState extends State<FeaturedWorkouts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 18.0, bottom: 4),
              child: Text(
                'Discover new workouts',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )),
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LegDay(),
              ));
                    },
                      child: swipers('assets/leg.jpeg')),
                    GestureDetector(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ArmDay(),
                      ));
                    },
                      child: swipers('assets/arm.jpeg')),
                    swipers('assets/chest.jpg'),
                    swipers('assets/back.jpg'),
                    swipers('assets/me.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
        // const resultProgress(),
      ],
    );
  }
}

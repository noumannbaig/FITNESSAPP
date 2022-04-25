import 'package:flutter/material.dart';
import '../logic/deitplan_info.dart';

List<Meal> meals = [
  Meal(
      mealTime: 'BREAKFAST',
      name: 'Toast with Fried Egg',
      imagePath: 'assets/breakfast.jpg',
      calories: '385',
      currentDietPlan: 'Paleo Deit'),
  Meal(
      mealTime: 'LUNCH',
      name: 'Chicken Salad',
      imagePath: 'assets/lunch.jpg',
      calories: '400',
      currentDietPlan: 'Paleo Deit'),
  Meal(
      mealTime: 'DINNER',
      name: 'Salmon Salad',
      imagePath: 'assets/dinner.jpg',
      calories: '450',
      currentDietPlan: 'Paleo Deit'),
];

String title = '';
class ShowDeitPlanPage extends StatefulWidget {
  String currentDietPlan;
  ShowDeitPlanPage({Key? key, required this.currentDietPlan}) : super(key: key);

  @override
  _ShowDeitPlanPageState createState() => _ShowDeitPlanPageState(currentDietPlan);
}

class _ShowDeitPlanPageState extends State<ShowDeitPlanPage> {
  String currentDietPlan;
  _ShowDeitPlanPageState(this.currentDietPlan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(currentDietPlan,
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
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              for (int s = 0; s < meals.length; s++)
                _MealCard(mealNumber: s,),
            ],
          ),
        ),
      ),
    );
  }
}

class _MealCard extends StatelessWidget {
int mealNumber;
_MealCard({ Key? key, required this.mealNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                  height: height * 0.4,
                  width: width,
                  child: Card(
                    color: Colors.white54,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        meals[mealNumber].imagePath,
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
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              color: Colors.black54,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  meals[mealNumber].name,
                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              )),
                              Container(
                              color: Colors.black54,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  meals[mealNumber].calories + ' Calories',
                                  style: const TextStyle(fontSize: 20, color: Colors.white),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Container(
                          color: Colors.black54,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              meals[mealNumber].mealTime,
                              style: const TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

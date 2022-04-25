import 'package:flutter/material.dart';
import '../UI/contact_us.dart';
import '../UI/Custom_deit_calculator_form.dart';
import '../UI/show_deit_plan.dart';
import '../logic/deitplan_info.dart';
String deitPlanName = '';

class DeitPlans extends StatelessWidget {
  const DeitPlans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Center(
              child: Text(
            'Deit Plans',
            style: TextStyle(color: Colors.black),
          )),
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
                          builder: (context) => const ContactUs()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         ExpansionTile(
          iconColor: Colors.deepPurple,
          collapsedIconColor: Colors.black87,
          textColor: Colors.deepPurple,
          collapsedTextColor: Colors.black87,
          title: const Text('The Paleo Diet'),
          subtitle: const Text(
              'The paleo diet claims that you should eat the same foods that your hunter-gatherer ancestors ate before agriculture developed.'),
          children: <Widget>[
            ListTile(
                title: const Text(
              'Paleo Diet 1',
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {
                setState(() {
                deitPlanName = 'The Paleo Diet';
                });
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowDeitPlanPage(currentDietPlan: deitPlanName,)),
                );
              }
          ),
          ],
        ),
         ExpansionTile(
          iconColor: Colors.deepPurple,
          collapsedIconColor: Colors.black87,
          textColor: Colors.deepPurple,
          collapsedTextColor: Colors.black87,
          title: const Text('The Vegan Diet'),
          subtitle: const Text(
              'A vegan diet contains only plants (such as vegetables, grains, nuts and fruits) and foods made from plants. Vegans do not eat foods that come from animals'),
          children: <Widget>[
            ListTile(
                title: const Text(
              'Vegan Diet 1',
              style: TextStyle(color: Colors.black87),
            ),
            onTap: () {
                setState(() {
                   deitPlanName = 'The Vegan Diet';
                });
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowDeitPlanPage(currentDietPlan: deitPlanName,)),
                );
              }
            ),
          ],
        ),
        ExpansionTile(
          iconColor: Colors.deepPurple,
          collapsedIconColor: Colors.black87,
          textColor: Colors.deepPurple,
          collapsedTextColor: Colors.black87,
          title: const Text('Low-Carb Diets'),
          subtitle: const Text('A low-carb diet limits carbohydrates'),
          children: <Widget>[
            ListTile(
              title: const Text(
                'Low-Carb Diet 1',
                style: TextStyle(color: Colors.black87),
              ),
              onTap: () {
                setState(() {
                   deitPlanName = 'Low-Carb Diets';
                });
                Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowDeitPlanPage(currentDietPlan: deitPlanName,)),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('To get customized Deit Plans',
                style: TextStyle(
                  color: Colors.black,
                )),
            FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CaloriesCalculatorForm()),
                );
              },
              child: const Text('Click here',
                  style: TextStyle(color: Colors.deepPurple)),
            )
          ],
        ),
      ],
    );
  }
}

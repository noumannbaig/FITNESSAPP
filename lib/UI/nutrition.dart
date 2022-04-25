import 'package:flutter/material.dart';
import '../UI/contact_us.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({Key? key}) : super(key: key);

  @override
  NutritionScreen createState() {
    return NutritionScreen();
  }
}

class NutritionScreen extends State<NutritionPage> {
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
            Text('Nutrition', style: TextStyle(color: Colors.black,)),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),
          onPressed: (){
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
      )
    );
  }
  
}
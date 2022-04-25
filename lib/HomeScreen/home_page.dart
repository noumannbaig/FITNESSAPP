
import './Screens/progress.dart';
import './Screens/mainpage.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? Title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: const Center(child: Text('FitKit', style: TextStyle(color: Colors.black),)),
          backgroundColor: Colors.purple,
          
          // elevation: 0,
          // actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.comment),color: Colors.black,)],
          // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu), color: Colors.black,)),
      ),
          body: Stack(
            children: const [
              BottomNav(),
              
            ],
          ),
    );
    
    
  }
}

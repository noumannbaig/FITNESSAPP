import '../Screens/basic_info.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../profile/profile_screen.dart';
import '../../UI/health.dart';
class BottomNav extends StatefulWidget {
  const BottomNav({ Key? key }) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabIndex = 0;
   List<Widget> tabs = [
    const BasicInfo(),
    const HealthScreen(),
    ProfileScreen(),
  ];
   onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:tabs[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.purple,
        onTap: onTapped,
        currentIndex: currentTabIndex,
        items: const [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), title: Text('Home')),
        BottomNavigationBarItem(icon: Icon(Icons.local_hospital), title: Text('Health')),
        BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile')),
      ]),
      // body: const BasicInfo(),
      
    );
    
  }
}


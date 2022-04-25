import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user_models.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({ Key? key }) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.purple,
       title: Text(
         'Account Info',

       ),
       centerTitle: true,
     ),
     body: Container(
       child: Text(FirebaseAuth.instance.currentUser?.email as String),
       color: Colors.purple,
       alignment: Alignment.center,
     )
     );
  }
}
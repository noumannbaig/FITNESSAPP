import '../Screens/progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
class BasicInfo extends StatefulWidget {
  const BasicInfo({Key? key}) : super(key: key);
  
  @override
  _BasicInfoState createState() => _BasicInfoState();
}

class _BasicInfoState extends State<BasicInfo> {
  List<String>? name=FirebaseAuth.instance.currentUser?.email?.split('@');
   late String? a=FirebaseAuth.instance.currentUser?.email;
  @override
  
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.only(top: 70, bottom: 8, left: 8, right: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.46,
                height: MediaQuery.of(context).size.height * 0.11,
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0,left:8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      // ListTile(
                      //   title: a as Widget,
                      // ),
                      Align(
                          alignment: Alignment.topLeft, child: Text(name![0] as String, style:TextStyle(fontWeight: FontWeight.bold, fontSize: 16),)),
                            
                          
                      Align(
                          alignment: Alignment.topLeft, child: Text('Lets check your activity', style: TextStyle(fontSize: 16),))
                    ],
                    
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 140.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: const CircleAvatar(
                    backgroundColor: Colors.purple,
                    backgroundImage: AssetImage('assets/me.jpg'),
                  ),
                ),
              ),
               
            ],
          ),
          const ProgressReport(),
        ],
      ),
    );
  
  }
}



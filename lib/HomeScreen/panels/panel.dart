import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../Videos/video.dart';
class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  const PanelWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
 

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.zero,
        controller: widget.controller,
        children: <Widget>[
          const SizedBox(
            height: 15,
          ),
          buildAboutText(),
          const SizedBox(
            height: 24,
          ),
        ],
      );

  Widget buildAboutText() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                width: 30,
                height: 5,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Leg Workout',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                    width: 100,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.purple,
                    ),
                    child: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Icon(
                            Icons.lock_clock,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 14.0),
                          child: Text(
                            '52:00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Container(
                      width: 170,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.purple,
                      ),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              '16 Exercises',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            
            Container(

              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.healthline.com%2Fhealth%2Ftoned-legs&psig=AOvVaw2rXc_KiLA6huNjOylLPlpN&ust=1650966322445000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCKCY_Pr2rvcCFQAAAAAdAAAAABAD'),
                fit: BoxFit.fill,
                ),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),]
                    
                  ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
                  child: FlatButton(
              color: Colors.red,
              splashColor: Colors.black12,
              
              onPressed: (){
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Videoplayer()),
  );
                
            },
              child: const Text(
                "Watch Now"
              ),
            ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
                  child: FlatButton(
              color: Colors.blue.shade400,
              splashColor: Colors.black12,
              
              onPressed: (){
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Videoplayer()),
  );     
            },
          child: const Text(
                "Watch Now"
              ),
            ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
                  child: FlatButton(
              color: Colors.purple.shade50,
              splashColor: Colors.black12,
              
              onPressed: (){
                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Videoplayer()),
  );
                
            },
              child: const Text(
                "Watch Now"
              ),
            ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              width: double.infinity,
              height: 120,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 7,
                    ),
                  ]),
            ),
          ],
        ),
      );
}

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class resultProgress extends StatefulWidget {
//   const resultProgress({Key? key}) : super(key: key);

//   @override
//   _resultProgressState createState() => _resultProgressState();
// }

// class _resultProgressState extends State<resultProgress> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top:12.0),
//       child: Container(
//         width: MediaQuery.of(context).size.width * 0.92,
//         height: MediaQuery.of(context).size.height * 0.07,
//         decoration: const BoxDecoration(
//             borderRadius: BorderRadius.all(
//               Radius.circular(12),
//             ),
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black12,
//                 spreadRadius: 5,
//                 blurRadius: 7,
//               )
//             ]),
//         child: Row(
//           children:  [
//               const Padding(
//                 padding: EdgeInsets.only(left:15.0),
//                 child: Icon(
//                 FontAwesomeIcons.bell,
//                 color: Colors.purple,
//             ),
//               ),

//               Align(alignment: Alignment.topLeft,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 68.0, top: 13),
//                   child: Column(
//                     children: const [
//                       Text('Keep the progress', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
//                       Text('You are more successful than', style: TextStyle(fontSize: 14),),
//                       Text('88% users.', style: TextStyle( fontSize: 14),),
//                     ],
//                   ),
//                 ),
//               )

//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:email_auth/email_auth.dart';
// import '../Screen/SignUpScreen.dart';
// import '../Screen/Home.dart';
// import '../Models/Constant.dart';

// class OtpForm extends StatefulWidget {
//   final String verifEmail;

//   const OtpForm({
//     Key key,
//     @required this.verifEmail,
//   }) : super(key: key);

//   @override
//   _OtpFormState createState() => _OtpFormState();
// }

// class _OtpFormState extends State<OtpForm> {
//   String val1, val2, val3, val4, val5, val6, otpVal;
//   FocusNode pin1FocusNode,
//       pin2FocusNode,
//       pin3FocusNode,
//       pin4FocusNode,
//       pin5FocusNode,
//       pin6FocusNode;

//   @override
//   void initState() {
//     super.initState();
//     pin2FocusNode = FocusNode();
//     pin3FocusNode = FocusNode();
//     pin4FocusNode = FocusNode();
//     pin5FocusNode = FocusNode();
//     pin6FocusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     pin2FocusNode.dispose();
//     pin3FocusNode.dispose();
//     pin4FocusNode.dispose();
//     pin5FocusNode.dispose();
//     pin6FocusNode.dispose();
//   }

//   void nextField(String value, FocusNode focusNode) {
//     if (value.length == 1) {
//       focusNode.requestFocus();
//     }
//   }

// /*
//   void sendOPT() async {
//     EmailAuth.sessionName = 'test session';
//     var res = await EmailAuth.sendOtp(receiverMail: widget.verifEmail);

//     if (res) {
//       print('Mail Sent');
//     }
//   }
// */
//   void verifyOTP() {
//     print(widget.verifEmail);
//     print(otpVal);
//     var res = null;
//     // EmailAuth.validate(receiverMail: widget.verifEmail, userOTP: otpVal);

//     if (res) {
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => Home()));
//     } else {
//       var snackBar = SnackBar(content: Text('Failed to verify the account'));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => SignUpScreen()));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           SizedBox(height: 5),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 width: 60,
//                 child: TextFormField(
//                   autofocus: true,
//                   obscureText: true,
//                   style: TextStyle(fontSize: 24),
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   decoration: otpInputDecoration,
//                   onChanged: (value) {
//                     val1 = value;
//                     nextField(value, pin2FocusNode);
//                   },
//                 ),
//               ),
//               SizedBox(width: 13),
//               SizedBox(
//                 width: 60,
//                 child: TextFormField(
//                   focusNode: pin2FocusNode,
//                   obscureText: true,
//                   style: TextStyle(fontSize: 24),
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   decoration: otpInputDecoration,
//                   onChanged: (value) {
//                     val2 = value;
//                     nextField(value, pin3FocusNode);
//                   },
//                 ),
//               ),
//               SizedBox(width: 13),
//               SizedBox(
//                 width: 60,
//                 child: TextFormField(
//                     focusNode: pin3FocusNode,
//                     obscureText: true,
//                     style: TextStyle(fontSize: 24),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     onChanged: (value) {
//                       val3 = value;
//                       nextField(value, pin4FocusNode);
//                     }),
//               ),
//               SizedBox(width: 13),
//               SizedBox(
//                 width: 60,
//                 child: TextFormField(
//                     focusNode: pin4FocusNode,
//                     obscureText: true,
//                     style: TextStyle(fontSize: 24),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     onChanged: (value) {
//                       val4 = value;
//                       nextField(value, pin5FocusNode);
//                     }),
//               ),
//               SizedBox(width: 13),
//               SizedBox(
//                 width: 60,
//                 child: TextFormField(
//                     focusNode: pin5FocusNode,
//                     obscureText: true,
//                     style: TextStyle(fontSize: 24),
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: otpInputDecoration,
//                     onChanged: (value) {
//                       val5 = value;
//                       nextField(value, pin6FocusNode);
//                     }),
//               ),
//               SizedBox(width: 13),
//               SizedBox(
//                 width: 60,
//                 child: TextFormField(
//                   focusNode: pin6FocusNode,
//                   obscureText: true,
//                   style: TextStyle(fontSize: 24),
//                   keyboardType: TextInputType.number,
//                   textAlign: TextAlign.center,
//                   decoration: otpInputDecoration,
//                   onChanged: (value) {
//                     if (value.length == 1) {
//                       val6 = value;
//                       pin6FocusNode.unfocus();
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           RaisedButton(
//               child: Text('Continue',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   )),
//               onPressed: () {
//                 otpVal = '$val1$val2$val3$val4$val5$val6';
//                 print(otpVal);
//                 verifyOTP();
//               }),
//         ],
//       ),
//     );
//   }
// }

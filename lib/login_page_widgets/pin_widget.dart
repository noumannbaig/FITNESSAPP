import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

class PinWidget extends StatefulWidget {
  final String verifEmail;
  final Function setOtpVal;
  final EmailAuth myAuth;

  const PinWidget({
    Key? key,
    required this.verifEmail,
    required this.setOtpVal,
    required this.myAuth,
  }) : super(key: key);

  @override
  State<PinWidget> createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  String val1 = '', val2 = "", val3 = "", val4 = "", val5 = "", val6 = "";
  FocusNode pin1FocusNode = FocusNode(),
      pin2FocusNode = FocusNode(),
      pin3FocusNode = FocusNode(),
      pin4FocusNode = FocusNode(),
      pin5FocusNode = FocusNode(),
      pin6FocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
    sendOPT();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void sendOPT() async {
    var res = await widget.myAuth.sendOtp(recipientMail: widget.verifEmail);
    if (res) {
      print('Mail Sent');
    }
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.453,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Enter Pin",
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    val1 = value;
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    val2 = value;
                    nextField(value, pin3FocusNode);
                  },
                ),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: TextFormField(
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      val3 = value;
                      nextField(value, pin4FocusNode);
                    }),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      val4 = value;
                      nextField(value, pin5FocusNode);
                    }),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: TextFormField(
                    focusNode: pin5FocusNode,
                    obscureText: true,
                    style: const TextStyle(fontSize: 24),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      val5 = value;
                      nextField(value, pin6FocusNode);
                    }),
              ),
              const SizedBox(width: 3),
              Expanded(
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    if (value.length == 1) {
                      val6 = value;
                      pin6FocusNode.unfocus();
                      widget.setOtpVal(val1 + val2 + val3 + val4 + val5 + val6);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

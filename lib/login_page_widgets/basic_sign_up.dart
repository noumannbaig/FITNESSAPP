import 'package:flutter/material.dart';

import './text_field_custom.dart';

class BasicSignUp extends StatelessWidget {
  final TextEditingController nameHandler;
  final TextEditingController emailHandler;
  final TextEditingController phoneHandler;
  final TextEditingController passwordHandler;

  final Function handleName;
  final Function handleEmail;
  final Function handlePhoneNumber;
  final Function handlePassword;

  const BasicSignUp({
    Key? key,
    required this.nameHandler,
    required this.emailHandler,
    required this.phoneHandler,
    required this.handleEmail,
    required this.handleName,
    required this.handlePassword,
    required this.handlePhoneNumber,
    required this.passwordHandler,
  }) : super(key: key);

  String? nameValidator(String? name) {
    String patttern = r"[a-zA-Z][a-zA-Z]*$";
    RegExp regExp = RegExp(patttern);
    if (name == null || name.isEmpty || name.trim().isEmpty) {
      return 'This field is required';
    }
    if (!regExp.hasMatch(name.trim())) {
      return 'Please enter valid name';
    }
    return null;
  }

  String? phoneValidator(String? phone) {
    String patttern = r'[+]?[0-9]{11}$';
    RegExp regExp = RegExp(patttern);
    if (phone == null || phone.isEmpty || phone.trim().isEmpty) {
      return 'Please enter phone number';
    } else if (!regExp.hasMatch(phone.trim())) {
      return 'Please enter valid phone number';
    } else if ((phone.length != 11)) {
      return 'Please enter valid phone number - 11 Digits';
    }
    return null;
  }

  String? emailValidator(String? email) {
    String patttern = r"[a-zA-Z_][a-zA-Z0-9_.]*[@][a-zA-Z]+[.]com$";
    RegExp regExp = RegExp(patttern);
    if (email == null || email.isEmpty || email.trim().isEmpty) {
      return 'This field is required';
    }
    if (!regExp.hasMatch(email.trim())) {
      return 'Please enter valid email!';
    }
    return null;
  }

  String? passwordValidator(String? pass) {
    if (pass == null || pass.isEmpty || pass.trim().isEmpty) {
      return 'This field is required';
    }
    if (pass.trim().length < 6) {
      return 'Password must be at least 6 characters in length - No White Spaces';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(
              bottom: 5,
            ),
            child: Text(
              'Sign up',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                    fontSize: 35,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          TextFieldCustom(
            hintPlace: 'Enter your name',
            type: TextInputType.emailAddress,
            labelText: 'Name',
            textHandler: nameHandler,
            maxCharacters: 255,
            submitHandler: handleName,
            isPasswordFeild: false,
            fieldValidator: nameValidator,
          ),
          TextFieldCustom(
            hintPlace: 'Enter your email',
            type: TextInputType.text,
            labelText: 'E-mail',
            textHandler: emailHandler,
            maxCharacters: 255,
            submitHandler: handleEmail,
            isPasswordFeild: false,
            fieldValidator: emailValidator,
          ),
          TextFieldCustom(
            hintPlace: 'Enter your phone number',
            type: TextInputType.phone,
            labelText: 'Phone Number',
            textHandler: phoneHandler,
            maxCharacters: 15,
            submitHandler: handlePhoneNumber,
            isPasswordFeild: false,
            fieldValidator: phoneValidator,
          ),
        ],
      ),
    );
  }
}

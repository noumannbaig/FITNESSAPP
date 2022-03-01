import 'package:flutter/material.dart';

import './text_field_custom.dart';

class PasswordFields extends StatelessWidget {
  final TextEditingController passwordHandler;
  final TextEditingController confirmPasswordHandler;
  final TextEditingController usernameHandler;

  final Function handlePassword;
  final Function handleConfirmPassword;
  final Function handleUsername;

  const PasswordFields({
    Key? key,
    required this.passwordHandler,
    required this.confirmPasswordHandler,
    required this.handleConfirmPassword,
    required this.handlePassword,
    required this.handleUsername,
    required this.usernameHandler,
  }) : super(key: key);

  String? usernameValidator(String? username) {
    String patttern = r"[_a-zA-Z][a-zA-Z_.0-9]*$";
    RegExp regExp = RegExp(patttern);
    if (username == null || username.isEmpty || username.trim().isEmpty) {
      return 'This field is required';
    } else if (!regExp.hasMatch(username.trim())) {
      return 'Please enter valid name';
    } else if (username.length < 6) {
      return 'Username must be atleast 6 characthers in length';
    }
    return null;
  }

  String? passwordValidator(String? pass) {
    if (pass == null || pass.isEmpty) {
      return 'This field is required';
    }
    if (pass.trim().length < 6) {
      return 'Password must be at least 6 characters in length - No White Spaces';
    }
    return null;
  }

  String? confirmPassValidator(String? pass) {
    if (pass == null || pass.isEmpty) {
      return 'This field is required';
    }
    if (passwordHandler.text != confirmPasswordHandler.text) {
      return "Password doesn't match!";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'One last step...',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          TextFieldCustom(
            hintPlace: 'Enter a username...',
            type: TextInputType.emailAddress,
            labelText: 'Username',
            textHandler: usernameHandler,
            maxCharacters: 255,
            submitHandler: handleUsername,
            isPasswordFeild: false,
            fieldValidator: usernameValidator,
          ),
          TextFieldCustom(
            hintPlace: 'Enter a password...',
            type: TextInputType.emailAddress,
            labelText: 'Password',
            textHandler: passwordHandler,
            maxCharacters: 255,
            submitHandler: handlePassword,
            isPasswordFeild: true,
            fieldValidator: passwordValidator,
          ),
          TextFieldCustom(
            hintPlace: 'Re-type your password...',
            type: TextInputType.text,
            labelText: 'Confirm Password',
            textHandler: confirmPasswordHandler,
            maxCharacters: 255,
            submitHandler: handleConfirmPassword,
            isPasswordFeild: true,
            fieldValidator: confirmPassValidator,
          ),
        ],
      ),
    );
  }
}

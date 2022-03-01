import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldCustom extends StatefulWidget {
  final String hintPlace;
  final TextInputType type;
  final String labelText;
  final TextEditingController textHandler;
  final int maxCharacters;
  final Function submitHandler;
  final bool isPasswordFeild;
  final Function fieldValidator;

  const TextFieldCustom({
    Key? key,
    required this.hintPlace,
    required this.type,
    required this.labelText,
    required this.textHandler,
    required this.maxCharacters,
    required this.submitHandler,
    required this.isPasswordFeild,
    required this.fieldValidator,
  }) : super(key: key);

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(3),
      width: double.infinity,
      child: TextFormField(
        validator: (str) {
          print('hello');
          return widget.fieldValidator(str);
        },
        maxLength: widget.maxCharacters,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        textCapitalization: TextCapitalization.none,
        autocorrect: false,
        keyboardType: widget.type,
        controller: widget.textHandler,
        maxLines: 1,
        onFieldSubmitted: (_) {
          widget.submitHandler();
        },
        onChanged: (_) {
          setState(() {});
        },
        obscureText: widget.isPasswordFeild && hidePassword ? true : false,
        style: const TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          // errorText: widget.fieldValidator(widget.textHandler.text),
          suffixIcon: widget.isPasswordFeild
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: FittedBox(
                        alignment: Alignment.center,
                        fit: BoxFit.fitHeight,
                        child: IconTheme(
                          data: const IconThemeData(),
                          child: Icon(
                            widget.isPasswordFeild && hidePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : null,
          counterText: "",
          hintText: widget.hintPlace,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontStyle: FontStyle.italic,
          ),
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
          floatingLabelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 3,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

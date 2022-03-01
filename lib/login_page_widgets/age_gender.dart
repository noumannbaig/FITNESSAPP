import 'package:flutter/material.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';
import 'package:intl/intl.dart';

class AgeGender extends StatefulWidget {
  final DateTime selectedDate;
  final Function changeDate;
  final Function changeGender;
  const AgeGender({
    Key? key,
    required this.selectedDate,
    required this.changeDate,
    required this.changeGender,
  }) : super(key: key);

  @override
  State<AgeGender> createState() => _AgeGenderState();
}

class _AgeGenderState extends State<AgeGender> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  child: Text(
                    'Select your gender',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                  ),
                  child: GenderPickerWithImage(
                    showOtherGender: true,
                    verticalAlignedText: false,
                    selectedGender: Gender.Male,
                    selectedGenderTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    unSelectedGenderTextStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                    onChanged: (gender) {
                      if (gender == Gender.Male) {
                        widget.changeGender(0);
                      } else if (gender == Gender.Female) {
                        widget.changeGender(1);
                      } else if (gender == Gender.Others) {
                        widget.changeGender(2);
                      }
                    },
                    equallyAligned: true,
                    animationDuration: const Duration(milliseconds: 300),
                    isCircular: true,
                    // default : true,
                    opacityOfGradient: 0.2,
                    padding: const EdgeInsets.all(3),
                    size: 50, //default : 40
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Text(
                    'Select your age',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        DateFormat.yMd().format(widget.selectedDate),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                      margin: const EdgeInsets.only(
                        right: 5,
                      ),
                    ),
                    TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () async {
                          showDatePicker(
                            context: context,
                            initialDate: widget.selectedDate, // Refer step 1
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          ).then((picked) {
                            if (picked != null) {
                              widget.changeDate(picked);
                            }
                          });
                        },
                        child: Text(
                          'Choose Date',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800,
                                    color: Theme.of(context).primaryColor,
                                  ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

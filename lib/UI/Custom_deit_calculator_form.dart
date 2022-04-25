import 'package:flutter/material.dart';
import '../logic/calories_calculator.dart';
class CaloriesCalculatorForm extends StatefulWidget {
  const CaloriesCalculatorForm({Key? key}) : super(key: key);

  @override
  _CaloriesCalculatorFormState createState() => _CaloriesCalculatorFormState();
}

class _CaloriesCalculatorFormState extends State<CaloriesCalculatorForm> {
  String dropdownvalue = 'Sedentary';
  var items = [
    'Sedentary',
    'Lightly Active',
    'Moderately Active',
    'Very Active',
    'Extra Active'
  ];
  final _formKey = GlobalKey<FormState>();
  CaloriesCalculator obj = CaloriesCalculator();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Calories Calculator',
                style: TextStyle(
                  color: Colors.black,
                )),
          ],
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                // weight box
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black87, width: 2.0),
                        ),
                        label: Text(
                          'Enter your weight in kg',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Feild';
                        } else {
                          for (int s = 0; s < value.length; s++) {
                            if (int.parse(value[s]) >= 0 &&
                                int.parse(value[s]) <= 9) {
                              continue;
                            } else {
                              return 'invalid entry';
                            }
                          }
                        }
                      },
                      onChanged: (value){
                        obj.setweight(int.parse(value));
                      },
                    ),
                  ),
                ),
                //height box
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black87, width: 2.0),
                        ),
                        label: Text(
                          'Enter your height in cm',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Feild';
                        } else {
                          for (int s = 0; s < value.length; s++) {
                            if (int.parse(value[s]) >= 0 &&
                                int.parse(value[s]) <= 9) {
                              continue;
                            } else {
                              return 'invalid entry';
                            }
                          }
                        }
                      },
                      onChanged: (value){
                        obj.setHeight(int.parse(value));
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // age box
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blueAccent, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black87, width: 2.0),
                        ),
                        label: Text(
                          'Enter your age in years',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required Feild';
                        } else {
                          for (int s = 0; s < value.length; s++) {
                            if (int.parse(value[s]) >= 0 ||
                                int.parse(value[s]) <= 9) {
                              continue;
                            } else {
                              return 'invalid entry';
                            }
                          }
                        }
                      },
                      onChanged: (value){
                        obj.setAge(int.parse(value));
                      },
                    ),
                  ),
                ),
                // top down menu box
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle,
                      color: Colors.deepPurple,
                    ),
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        iconDisabledColor: Colors.black,
                        iconEnabledColor: Colors.white,
                        hint: const Text('Select how active you are', style: TextStyle(color: Colors.white),),
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: Colors.deepPurple,
                        value: dropdownvalue,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
                                style: const TextStyle(color: Colors.white),
                              ));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            obj.setCondition(dropdownvalue);
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                minWidth: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                        ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Row(
                            children: [
                              Text('Your maintainance Calories are ' + obj.calculator().toString()),
                            ],
                          )),
                        );
                    });
                  }
                },
                child: const Text('Calculate',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

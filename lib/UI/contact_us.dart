import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUs createState() => _ContactUs();
}

class _ContactUs extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Feedback',
                  style: TextStyle(
                    color: Colors.black,
                  )
              ),
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),

          // Username or Email Feild
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                label: Text(
                  'Enter your Username or Email',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Feild';
                }
                else if(value.length < 6){
                  return 'Invalid username or email';
                }
              },
            ),
          ),
          // Feedback Feild
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              maxLines: 5,
              minLines: 5,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87, width: 2.0),
                ),
                label: Text(
                  'Enter your Issues/Feedback',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Required Feild';
                }
                
              },
            ),
          ),
          // Login Button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              minWidth: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Feedback form Successful')),
                      );
                  });
                }
              },
              child: const Text('Submit',
                  style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      )
    ),
    );
  }
}
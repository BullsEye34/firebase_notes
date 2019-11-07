import 'package:firebase_notes/login.dart';
import 'package:firebase_notes/notes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  TextEditingController uname = new TextEditingController();
  TextEditingController pwd = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color(0xff121212),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.height / 2.5,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(29),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Form(
                autovalidate: true,
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: uname,
                        validator: validateEmail /*(value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        }*/,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'Username (Mail ID)',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: pwd,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width/1.5,
                            height: MediaQuery.of(context).size.height / 20,
                            child: FlatButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  signupe();
                                }

                              },
                              color: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(19.0),
                                ),
                              ),
                              child: Text("Sign Up"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width/1.5,
                            height: MediaQuery.of(context).size.height / 20,

                            child: OutlineButton(
                              onPressed: () {
                                /*_navigateToNextScreen(context, login());*/
                                Navigator.pop(context);
                              },
                              borderSide: BorderSide(width: 3, color: Colors.blue),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(19.0),
                                ),
                              ),
                              child: Text("Back to Login"),
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _navigateToNextScreen(BuildContext context, Widget n) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => n),
    );
  }
  signupe() async{
    print("*******************************************************");
    print(uname.text + " " + pwd.text);
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: uname.text,
      password: pwd.text,
    ))
        .user;
    print(user.uid);
    _navigateToNextScreen(context, notes());

  }
}

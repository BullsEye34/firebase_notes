import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
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
                              onPressed: () {},
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
                                _navigateToNextScreen(context, signup());
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
}

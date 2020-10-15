import 'package:EmployeeApp/core/post_login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  static final tag = 'LoginPage';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
          centerTitle: true,
        ),
        body: Center(
          child: Card(
              elevation: 5,
              child: Container(
                height: 300,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('EmployeeApp',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                      Text('Login', style: TextStyle(fontSize: 25)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.email,
                            ),
                            hintText: 'Enter your email address',
                          ),
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 14.0),
                            prefixIcon: Icon(
                              Icons.lock,
                            ),
                            hintText: 'Enter your password',
                          ),
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                            onPressed: email == "" || password == ""
                                ? () {
                                    Fluttertoast.showToast(
                                        msg: 'All fields are not filled',
                                        timeInSecForIos: 3,
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                : () {
                                    signIn(email, password, context);
                                  },
                            child: Text('Login')),
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}

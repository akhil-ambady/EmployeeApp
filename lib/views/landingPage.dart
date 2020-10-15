import 'dart:async';
import 'package:EmployeeApp/views/Pages/list_page.dart';
import 'package:EmployeeApp/views/Pages/login_oage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        loadpage();
      },
    );
  }

  Future<void> loadpage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var auth = prefs.getString('Authorization');
    if (auth == null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ListPage(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Text('EmployeeApp',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

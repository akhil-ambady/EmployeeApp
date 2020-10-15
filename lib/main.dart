import 'package:EmployeeApp/routes.dart';
import 'package:EmployeeApp/views/landingPage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// Navigator routes
      routes: Routes.routes,
      debugShowCheckedModeBanner: false,
      home: LandingPage());
  }
}

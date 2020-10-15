import 'package:EmployeeApp/views/Pages/login_oage.dart';
import 'package:flutter/material.dart';

class Routes {
  /// getters
  static Map<String, WidgetBuilder> get routes => _routes;

  /// Add all the named Routes here
  /// Navigator.pushNamed(context, <name> )
  static Map<String, WidgetBuilder> _routes = {
    LoginPage.tag: (context) => LoginPage(),
  };
}

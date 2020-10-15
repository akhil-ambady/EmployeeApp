import 'package:EmployeeApp/constants.dart';
import 'package:EmployeeApp/views/Pages/list_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

signIn(String email, String pass, BuildContext context) async {
  var jsonResponse;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map data = {'username': email, 'password': pass};

  var response = await http.post(apiurl + "/api/login", body: data);

  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
    print(jsonResponse);
    if (jsonResponse != null) {
      await prefs.setString("Authorization", "Bearer " + jsonResponse['token']);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => ListPage()));
    }
  } else {}
}

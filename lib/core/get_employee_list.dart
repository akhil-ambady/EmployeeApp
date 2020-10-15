import 'dart:convert';

import 'package:EmployeeApp/constants.dart';
import 'package:EmployeeApp/core/view_model/userResponse.dart';
import 'package:EmployeeApp/core/view_model/userlist.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<List<UserList>> getEmployeeList() async {
  var response = await http.get(apiurl + "/api/users");

  if (response.statusCode == 200) {
    var userList = userResponseFromJson(response.body);
    return userListFromJson(jsonEncode(userList.data));
  } else {
    Fluttertoast.showToast(
        msg: 'Something went wrong',
        timeInSecForIos: 3,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    return []; // error case
  }
}

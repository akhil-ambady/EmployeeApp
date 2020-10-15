import 'package:EmployeeApp/core/get_employee_list.dart';
import 'package:EmployeeApp/core/view_model/userlist.dart';
import 'package:EmployeeApp/views/Pages/login_oage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    getEmployeeList().then((value) {
      user.clear();
      setState(() {
        user.addAll(value);
      });
    });
    // getallgroupsme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Employee List'),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.remove('Authorization');
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text('Logout')),
            )
          ],
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                UserList tempuser = user[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(50)),
                    height: 100.0,
                    child: Row(
                      children: [
                        Padding(
                              padding: const EdgeInsets.only(left: 25.0),
                              child: Image.network(
                                '${tempuser.avatar}',
                                scale: 2.0,
                              ),
                            ),
                        Padding(
                          padding: const EdgeInsets.only(left: 45.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${tempuser.firstName} ${tempuser.lastName}",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "${tempuser.email}",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: user.length,
            ),
          ),
        ]));
  }
}

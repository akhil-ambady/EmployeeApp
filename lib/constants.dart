import 'package:shared_preferences/shared_preferences.dart';

String apiurl = "https://reqres.in";

Future<String> getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var tokens = prefs.getString('Authorization');
  return tokens;
}

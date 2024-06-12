import 'package:http/http.dart' as http;
import 'package:language/Pages/OtherPages/error.dart';
import 'package:language/Services/urls.dart';
import 'package:language/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

getPage() async {
  var res = await http.get(Uri.parse(APIConfig.APIUrl));
  if (res.statusCode == 200) {
    return MainPage();
  } else {
    return const ErrorPage(500);
  }
}

getCurrentPage() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.getString("currentPage");
}

void setCurrentPage(String value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString("currentPage", value);
}

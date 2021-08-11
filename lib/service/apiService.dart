import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {



 static Uri url = Uri.http("deneme.appveweb.site", "/api/cities");

  static getCities() async {
    http.Response response = await http.get(url);
    if (response.statusCode==200) {
          print(response.body);
    } else {
          print(response.statusCode);
    }

  }
}

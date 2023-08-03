
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../app_consts.dart';

class AuthServices{


 static Future<http.Response> login(String email, String password) async {
    Map data = {
      "password": "12345678",
      "email": "flutter-task@test.com"
    };
    var body = json.encode(data);
    var url = Uri.parse('${baseUrl}auth/login');
    http.Response response = await http.post(
      url,
      body: body,
      headers: headers
    );
    print(response.body);
    return response;
  }


}
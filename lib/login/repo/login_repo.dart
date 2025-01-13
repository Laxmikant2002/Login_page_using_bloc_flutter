import 'dart:convert';
import 'package:my_app/login/model/login_resp_model.dart';
import 'package:http/http.dart' as http;

class LoginRepo {
  Future<LoginResp> login(String userName, String password) async {
    var url = "https://dummyjson.com/auth/login";

    var response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'username': userName,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Parse the response body and return a LoginResp object
      return LoginResp.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // Handle error response
      throw Exception('Failed to login');
    }
  }
}

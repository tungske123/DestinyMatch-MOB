import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Accountservice {
  //final String apiLink = "http://10.0.2.2:5107/api";
  //final String apiLink = "http://localhost:5107/api";
  final String apiLink = "https://destiny-match.azurewebsites.net/api";

  final storage = const FlutterSecureStorage();

  Accountservice();

  Future<bool> login(String email, String password) async {
    final url = Uri.parse("$apiLink/accounts/login");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"email": email, "password": password}),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseBody = jsonDecode(response.body);

      String token = responseBody['token'];

      // Lưu token vào Flutter Secure Storage
      await storage.write(key: "token", value: token);
      //print(token);
      // Hoặc lưu trữ thông tin người dùng vào Shared Preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonEncode(responseBody['token']));
      return true;
    } else {
      print({"error": "Login failed"});
      return false;
    }
  }

  Future<bool> isLoggedIn() async {
    var token = await storage.read(key: "token");
    return token != null;
  }
}

import 'dart:convert';

import 'package:destinymatch/models/Message.dart';
import 'package:http/http.dart' as http;

class Messageservice {
  String BASE_URL = "https://localhost:7215/api";

  Future<List<Message>> getMessages() async {
    final url = Uri.parse("$BASE_URL/messages");
    final response = await http.get(url);
    if (response.statusCode == 200) {

      List<dynamic> jsonData = jsonDecode(response.body);
      List<Message> members = jsonData.map((item) => Message.fromJson(item)).toList();
      print(members);
      return members;
    } else {
      throw Exception('Failed to load members');
    }
  }
}

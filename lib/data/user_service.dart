import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/user_model.dart';

class UserService {
  final String apiUrl = 'https://randomuser.me/api/?results=20';

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../domain/user_model.dart';

class UserProvider extends ChangeNotifier {
  List<User> users = [];
  bool isLoading = false;
  String? error;

  /// Fetch 20 random users from API
  Future<void> fetchUsers() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final response =
      await http.get(Uri.parse('https://randomuser.me/api/?results=20'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Parse user list
        users = (data['results'] as List)
            .map((json) => User.fromJson(json))
            .toList();

        // Debug print to verify number of users
        debugPrint('✅ Fetched ${users.length} users successfully.');
      } else {
        error = 'Failed to load users (Status code: ${response.statusCode})';
      }
    } catch (e) {
      error = 'Error fetching users: $e';
    }

    isLoading = false;
    notifyListeners();
  }

  /// Toggle Like for a specific user
  void toggleLike(User user) {
    final index = users.indexOf(user);
    if (index != -1) {
      users[index].isLiked = !users[index].isLiked;
      notifyListeners();
    }
  }
}

import 'package:fininfocom/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserViewModel extends ChangeNotifier {
  User? _user;

  User? get user => _user;

  Future<void> fetchRandomUser() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));
    if (response.statusCode == 200) {
      final userData = json.decode(response.body)['results'][0];
      _user = User(
        name: '${userData['name']['first']} ${userData['name']['last']}',
        location:
            '${userData['location']['city']}, ${userData['location']['country']}',
        email: userData['email'],
        dob: userData['dob']['date'],
        registeredDate: DateTime.parse(userData['registered']['date']),
      );
      notifyListeners();
    } else {
      throw Exception('Failed to load random user');
    }
  }
}

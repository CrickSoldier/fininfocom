import 'dart:convert';
import 'package:fininfocom/model/dog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DogViewModel extends ChangeNotifier {
  Dog? _currentDog;

  Dog? get currentDog => _currentDog;

  Future<void> fetchRandomDog() async {
    try {
      final response =
          await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final String imageUrl = data['message'];
        // print(imageUrl);
        _currentDog = Dog(imageUrl: imageUrl);

        notifyListeners();
      } else {
        throw Exception('Failed to fetch a random dog image');
      }
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

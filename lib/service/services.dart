import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:user_dashboard/model/user_profile.dart';

class Services {
  Future<List<UserProfile>> fetchUser() async {
    try {
      final url = Uri.parse('https://randomuser.me/api/?results=20');

      final response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        List<UserProfile> users = (jsonResponse['results'] as List)
            .map((userJson) => UserProfile.fromJson(userJson))
            .toList();
        return users;
      } else {
        throw Exception('Failed to fetch Users Server error!');
      }
    } catch (err) {
      log(err.toString());
      throw Exception('Failed to fetch Users ${err.toString()}');
    }
  }
}

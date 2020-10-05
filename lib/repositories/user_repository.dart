import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:laptop_mobile/extensions/env/env.dart';

class UserRepository {
  Future<bool> login(String userName, String password) async {
    String signinUrl = 'users/signin?userName=$userName&password=$password';
    final res =
        await http.post(Env.baseUrl(signinUrl), headers: Env.baseHeader);

    if (res.statusCode == 200) {
      return true;
    } else {
      throw Exception('UserRepository - login() - Failed - ${res.statusCode}');
    }
  }
}

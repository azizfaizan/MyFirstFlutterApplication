import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_first_flutter_app/models/User.dart';

class ApiService {
  void login(String enteredPassword, String enteredEmail) async {
    const url = 'http://restapi.adequateshop.com/api/authaccount/login';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: {"email": enteredEmail, "password": enteredPassword},
        headers: {HttpHeaders.contentTypeHeader: "application/json"});

    final responseCode = response.statusCode;
    User h = User(name: enteredEmail, password: enteredPassword);
    print('email  $enteredEmail');
    print('user saved in model $h');
    print(responseCode.toString());
    print(jsonDecode(response.body));
  }
}

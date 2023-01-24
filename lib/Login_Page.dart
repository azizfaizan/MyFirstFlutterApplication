import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  String enteredEmail="";
  String enteredPassword="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.lock,
                size: 100,
              ),

              SizedBox(
                height: 10,
              ),

              Text(
                "Hello Again!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome back,you\'ve been missing since long time",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 50),
              //email field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: TextField(
                        onChanged: (newText) { enteredEmail = newText; },
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Enter Email'),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //password field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: TextField(
                      onChanged: (newText) { enteredPassword = newText; },
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Enter Password'),

                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //login button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      login(enteredPassword,enteredEmail);
                      print('register taped $enteredEmail and $enteredPassword');
                    },
                    child: Text(
                      " register now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void login(String enteredPassword, String enteredEmail) async {
  const url = 'http://restapi.adequateshop.com/api/authaccount/login';
  final uri = Uri.parse(url);
  final response = await http.post(uri, body: {"email": enteredEmail, "password": enteredPassword});
  final responseCode = response.statusCode;
  print('email  $enteredEmail');
  print(responseCode.toString());
  print(jsonDecode(response.body));
}

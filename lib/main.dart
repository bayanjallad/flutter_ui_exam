import 'package:exam/core/config/get_it_configer.dart';
import 'package:exam/pages/chat_page.dart';

import 'package:exam/pages/logIn_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:core.get<SharedPreferences>().getString("UserName")==null? LogInPage():ChatPage(),
    );
  }
}
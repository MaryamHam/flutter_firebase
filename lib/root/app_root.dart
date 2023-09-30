import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/home_screen.dart';
import 'package:flutter_firebase/screens/user_screen.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

       home: HomeScreen(),
       //home: GetUser(),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/success.dart';
import 'form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FormScreen(),
      initialRoute: '/home',
      routes: {
        '/home':(context)=>FormScreen(),
        '/success':(context)=>Success(),
      },
    );
  }
}

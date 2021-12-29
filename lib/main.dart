import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health/screens/home_screen.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.grey,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mum&baby',
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(
            color: Colors.red,
            centerTitle: true,
          )
      ),
      debugShowCheckedModeBanner: false,
      home:  const HomeScreen(),
    );
  }
}

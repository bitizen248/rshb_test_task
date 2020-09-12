import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:divan_test_task_rshb/screens/main_screen.dart';
import 'package:flutter/material.dart';

class RshbApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'РСХБ Тествое задание',
      theme: ThemeData(
        primaryColor: RshbColors.primary,
        appBarTheme: AppBarTheme(
            color: Colors.white,
            brightness: Brightness.light,
        ),
        primaryTextTheme: TextTheme(
            headline6: TextStyle(
                color: Colors.black
            )
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

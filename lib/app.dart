import 'package:divan_test_task_rshb/resources/products_api.dart';
import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:divan_test_task_rshb/screens/main_screen.dart';
import 'package:flutter/material.dart';

import 'models/sort_order.dart';

class RshbApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'РСХБ Тествое задание',
      theme: ThemeData(
        primaryColor: RshbColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
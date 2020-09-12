import 'package:divan_test_task_rshb/bloc/favorites_bloc.dart';
import 'package:divan_test_task_rshb/screens/colors.dart';
import 'package:divan_test_task_rshb/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RshbApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (c) => FavoritesCubit(),)
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

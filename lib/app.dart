import 'package:flutter/material.dart';
import 'package:partner/constants.dart';
import 'package:partner/screens/home_screen.dart';
import 'package:partner/utils/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Partner 找夥伴、找活動、學技能',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Utils.createMaterialColor(Constants.primaryYellow),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}

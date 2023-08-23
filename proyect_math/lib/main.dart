
import 'package:flutter/material.dart';
import 'package:proyect_math/pages/home_page.dart';
import 'package:proyect_math/routes/quiz_routes.dart';
import 'package:proyect_math/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: AppRoutes.initialRote,
     routes: AppRoutes.playAppRoutes(),
      theme: AppTheme.indigoTheme,
      home: const HomePage(),
    );
  }
}

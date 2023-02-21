import 'package:firebase_app/pages/home.dart';
import 'package:firebase_app/firebase_app/app_routes.dart';
import 'package:flutter/material.dart';

class FirebaseApp extends StatelessWidget {
  const FirebaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.HOME: (context) => const Home()
      },
    );
  }
}

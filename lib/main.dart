import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paan/Pages/PagePaths.dart';
import 'package:paan/Pages/SignIn/signIn.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: pagePaths,
      home: const SignInPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:voteme/UI/DeleteVoter.dart';
import 'package:voteme/UI/DisplayAllVoter.dart';
import 'package:voteme/UI/GetOneVoter.dart';
import 'package:voteme/UI/HomeScreen.dart';
import 'package:voteme/UI/updateUi.dart';
import 'package:voteme/UI/updateVoter.dart';
import 'package:voteme/Utils/Myroutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(), routes: {
      MyRoutes.getAll: (context) => DisplayAllUser(),
      MyRoutes.update: (context) => UpdateUser(),
      MyRoutes.getOne: (context) => GetUser(),
      MyRoutes.delete: (context) => DeleteUser()
    });
  }
}

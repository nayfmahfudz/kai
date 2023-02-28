import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kai/jam.dart';
import 'package:kai/splashscreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'Login.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initializeService();
  initializeDateFormatting('id_ID', null).then((_) => runApp(MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp();
// service.startService();
  @override
  State<MyApp> createState() => _MyAppState();
}

@override
class _MyAppState extends State<MyApp> {
  initState() {
    super.initState();
  }

  Future splashscreen() async {
    return await Future.delayed(Duration(seconds: 6), () {
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Balai Lab',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
          future: splashscreen(),
          builder: ((context, snapshot) {
            if (snapshot.data == true) {
              return Login();
            } else {
              return SplashScreen();
            }
          }),
        ));
  }
}

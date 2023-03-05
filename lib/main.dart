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
import 'package:intl/date_symbol_data_local.dart';
import 'Login.dart';
import 'listGerbang.dart';
import 'setting.dart';

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

  bool keySucces = false;
  Future splashscreen() async {
    final prefs = await SharedPreferences.getInstance();
    key = prefs.getString("key");
    var response = await Dio()
        .get("https://api-kai-qc.arthoize.com/api/v1/carriage-checklist",
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $key",
            }));
    print(response.data["message"]);
    if (response.data["message"] == "success") {
      keySucces = true;
    } else {
      keySucces = false;
    }
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
              if (keySucces) {
                return ListGerbang();
              } else
                return Login();
            }

            return SplashScreen();
          }),
        ));
  }
}

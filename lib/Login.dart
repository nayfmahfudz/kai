import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:kai/listGerbang.dart';
import 'package:kai/setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/fom.dart';
import 'component/sizeConfig.dart';
import 'fom.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  var namaController = new TextEditingController();
  var passwordController = new TextEditingController();
  var hide = true;
  Future Login(String email, String pass) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      FormData formData = FormData.fromMap({
        "email": email,
        "password": pass,
      });
      var response = await Dio()
          .post("http://api-kai-qc.arthoize.com/api/v1/login", data: formData);
      print(response.data);
      if (response.data["message"] == "Login success") {
        // berhasil(context, response.data["message"]);
        prefs.setString('key', response.data["access_token"]);
        key = response.data["access_token"];
        return true;
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .size
        .shortestSide);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(flex: getDeviceType() ?? 1, child: Container()),
            Expanded(
              flex: getDeviceTypeContent() ?? 3,
              child: Center(
                child: Form(
                    key: formKey,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: tinggiAs(context) * 30),
                      children: <Widget>[
                        // logo,
                        SizedBox(height: 24.0),
                        nama(namaController, context),
                        SizedBox(height: 8.0),
                        password(passwordController, hide),
                        SizedBox(height: 24.0),
                        GestureDetector(
                            onTap: () {
                              Login(namaController.text,
                                      passwordController.text)
                                  .then(
                                (value) {
                                  if (value) {
                                    navigateToNextScreen(
                                        context, ListGerbang());
                                  }
                                },
                              );
                            },
                            child: loginButton('Log In', biru, putih)),
                        SizedBox(height: 8.0),
                        text("Belum punya akun?", () {}),
                      ],
                    )),
              ),
            ),
            Expanded(flex: getDeviceType() ?? 1, child: Container()),
          ],
        ));
  }
}

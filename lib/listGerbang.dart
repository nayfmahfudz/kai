import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kai/component/cardoutlet.dart';
import 'package:kai/setting.dart';

class ListGerbang extends StatefulWidget {
  const ListGerbang({Key key}) : super(key: key);

  @override
  State<ListGerbang> createState() => _ListGerbangState();
}

Future gerbang() async {
  try {
    var response =
        await Dio().get("http://api-kai-qc.arthoize.com/api/v1/carriage",
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $key",
            }));
    print(response);
    return response.data["data"];
  } catch (e) {
    print(e);
  }
}

class _ListGerbangState extends State<ListGerbang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: gerbang(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length ?? 0,
                    shrinkWrap: true,
                    itemBuilder: (context, i) => Cardoutlet(snapshot.data[i]));
              }
            })));
  }
}

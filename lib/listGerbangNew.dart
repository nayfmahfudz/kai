import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kai/ceklist.dart';
import 'package:kai/component/cardoutlet.dart';
import 'package:kai/component/fom.dart';
import 'package:kai/setting.dart';

import 'component/cardGerbongBaru.dart';

class ListGerbangBaru extends StatefulWidget {
  const ListGerbangBaru();

  @override
  State<ListGerbangBaru> createState() => _ListGerbangBaruState();
}

Future gerbang() async {
  try {
    var response =
        await Dio().get("https://api-kai-qc.arthoize.com/api/v1/carriage",
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $key",
            }));
    print(response.data["data"]);
    return response.data["data"];
  } catch (e) {
    print(e);
  }
}

Future gerbangDetail(id) async {
  try {
    var response = await Dio()
        .get("https://api-kai-qc.arthoize.com/api/v1/carriage-checklist/${id}",
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $key",
            }));
    print(response);
    return response.data;
  } catch (e) {
    print(e);
  }
}

var searchcontroller = TextEditingController();

class _ListGerbangBaruState extends State<ListGerbangBaru> {
  bool hideLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: GestureDetector(
          onTap: (() => Navigator.of(context).pop()),
          child: Container(
            width: 60,
            height: 60,
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.02),
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: biru,
              ),
            ),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20.0),
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            SizedBox(
              height: 20,
            ),
            search(searchcontroller, context),
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
                future: gerbang(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        itemCount: snapshot.data.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, i) => GestureDetector(
                            onTap: () {
                              Loading(context);
                              gerbangDetail(snapshot.data[i]["uuid"]).then(
                                (value) {
                                  if (value["message"] == "success") {
                                    navigateToNextScreen(
                                        context,
                                        CekList(
                                            false, value, snapshot.data[i]));
                                  }
                                },
                              );
                            },
                            child: CardGerbangBaru(snapshot.data[i])));
                  } else
                    return Container();
                })),
          ],
        ));
  }
}

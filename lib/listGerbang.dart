import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kai/ceklist.dart';
import 'package:kai/component/cardoutlet.dart';
import 'package:kai/component/fom.dart';
import 'package:kai/setting.dart';

class ListGerbang extends StatefulWidget {
  const ListGerbang({Key key}) : super(key: key);

  @override
  State<ListGerbang> createState() => _ListGerbangState();
}

Future gerbang() async {
  try {
    var response = await Dio()
        .get("https://api-kai-qc.arthoize.com/api/v1/carriage-checklist",
            options: Options(headers: {
              "Content-Type": "application/json",
              "Authorization": "Bearer $key",
            }));
    print(response);
    return response.data["data"]["data"];
  } catch (e) {
    print(e);
  }
}

var searchcontroller = TextEditingController();

class _ListGerbangState extends State<ListGerbang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        onTap: () =>
                            navigateToNextScreen(context, CekList(true)),
                        child: Cardoutlet(snapshot.data[i])));
              } else
                return Container();
            })),
      ],
    ));
  }
}

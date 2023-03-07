import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kai/component/clippath.dart';
import 'package:page_transition/page_transition.dart';

import '../setting.dart';

class CardGerbangBaru extends StatefulWidget {
  CardGerbangBaru(this.outlet);
  Map outlet = {};

  @override
  State<CardGerbangBaru> createState() => _CardGerbangBaruState();
}

bool parameter = false;

class _CardGerbangBaruState extends State<CardGerbangBaru> {
  double _height = 0;
  double _width = 0;
  ubah(bool parameter, BuildContext context) {
    if (parameter == true) {
      setState(() {
        _height = MediaQuery.of(context).size.height;
        _width = MediaQuery.of(context).size.width * 0.65;
      });
    } else {
      setState(() {
        _height = 0;
        _width = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: parameter == false ? putih : putih.withOpacity(0.7),
        shape: OutlineInputBorder(
            borderSide: BorderSide(
              color: putih.withOpacity(0),
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              children: [
                Text(widget.outlet["name"] ?? "",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      fontSize: 22,
                      color: biru,
                      fontWeight: FontWeight.w800,
                      textStyle: Theme.of(context).textTheme.subtitle1,
                    )),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(10),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(6, 6, 6, 6),
                            child: Text(widget.outlet["code"] ?? "",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                  color: biru,
                                  fontWeight: FontWeight.w800,
                                  textStyle:
                                      Theme.of(context).textTheme.subtitle1,
                                )),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(6, 6, 0, 6),
                          child: Text(widget.outlet["carriage_type_uuid"] ?? "",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.w800,
                                textStyle:
                                    Theme.of(context).textTheme.subtitle1,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          // child: Image.asset("assets/uang.png",
                          //     height: 10, fit: BoxFit.contain),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child:
                                Text(widget.outlet["carriage_type_name"] ?? "",
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: biru,
                                      fontWeight: FontWeight.w800,
                                      textStyle:
                                          Theme.of(context).textTheme.subtitle1,
                                    )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          // child: Image.asset("assets/uang.png",
                          //     height: 10, fit: BoxFit.contain),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  parameter = !parameter;
                  print(parameter);
                  ubah(parameter, context);
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: ClipPath(
                        clipper: CardOpen(),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          decoration: BoxDecoration(
                            color: birumuda,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 1),
                                blurRadius: 5,
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              // child: parameter == true
                              //     ? Image.asset("assets/Button_Open_Slide.png",
                              //         height: 20, fit: BoxFit.contain)
                              //     : Image.asset("assets/Button_Close_Slide.png",
                              //         height: 20, fit: BoxFit.contain),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

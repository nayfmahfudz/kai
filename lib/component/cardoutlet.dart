import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kai/component/clippath.dart';
import 'package:page_transition/page_transition.dart';

import '../setting.dart';

class Cardoutlet extends StatefulWidget {
  Cardoutlet(this.outlet);
  Map outlet = {};

  @override
  State<Cardoutlet> createState() => _CardoutletState();
}

bool parameter = false;

class _CardoutletState extends State<Cardoutlet> {
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
      height: MediaQuery.of(context).size.height * 0.26,
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
              padding: const EdgeInsets.fromLTRB(16, 16, 36, 16),
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
                        Expanded(child: SizedBox()),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(6, 6, 0, 6),
                          child: Text('Menunggu',
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
                            child: Text('',
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 600),
                      width: _width,
                      height: _height,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 10, 10),
                        color: birumuda,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.055,
                                          child: GestureDetector(
                                              onTap: () {},
                                              child: Column(
                                                children: [
                                                  // Image.asset(
                                                  //     "assets/Button_Input_Masuk.png",
                                                  //     fit: BoxFit.contain),
                                                  Text('MASUK',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        color: biru,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                      )),
                                                ],
                                              )))),
                                  Expanded(
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.055,
                                          child: GestureDetector(
                                              onTap: () {},
                                              child: Column(
                                                children: [
                                                  // Image.asset(
                                                  //     "assets/Button_Input_Keluar.png",
                                                  //     fit: BoxFit.contain),
                                                  Text('KELUAR',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        color: biru,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                      )),
                                                ],
                                              )))),
                                  Expanded(
                                      child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.11,
                                    width: MediaQuery.of(context).size.height *
                                        0.055,
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            // Image.asset(
                                            //     "assets/Button_Input_Pindah.png",
                                            //     fit: BoxFit.contain),
                                            Text('Pindah',
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.roboto(
                                                  fontSize: 10,
                                                  color: biru,
                                                  fontWeight: FontWeight.w400,
                                                  textStyle: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                )),
                                          ],
                                        )),
                                  )),
                                  Expanded(
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.055,
                                          child: GestureDetector(
                                              onTap: () {},
                                              child: Column(
                                                children: [
                                                  // Image.asset(
                                                  //     "assets/Button_Input_Mutasi.png",
                                                  //     fit: BoxFit.contain),
                                                  Text('MUTASI',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        color: biru,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                      )),
                                                ],
                                              )))),
                                  Expanded(
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.055,
                                          child: GestureDetector(
                                              onTap: () {},
                                              child: Column(
                                                children: [
                                                  // Image.asset(
                                                  //     "assets/Button_Input_Kurs.png",
                                                  //     fit: BoxFit.contain),
                                                  Text('KURS',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 12,
                                                        color: biru,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                      )),
                                                ],
                                              )))),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0,
                                    style: BorderStyle.none,
                                    color: putih.withOpacity(0),
                                  ),
                                  color: birumuda),
                            ),
                            Expanded(
                                flex: 4,
                                child: Container(
                                  padding: EdgeInsets.only(top: 3),
                                  width: MediaQuery.of(context).size.width,
                                  child: Card(
                                      semanticContainer: true,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: putih,
                                      shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: putih.withOpacity(0),
                                            width: 0.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: ListView(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        padding: const EdgeInsets.all(10),
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 1, 0, 0),
                                                child: Text('Jumlah Barang ',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 1, 0, 0),
                                                  child: Text(
                                                      '...............................................................',
                                                      textAlign: TextAlign.left,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        color: biru,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                      )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 2, 0, 4),
                                                child: Text('16',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 1, 0, 0),
                                                child: Text('Total IDR ',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: biru,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 1, 0, 0),
                                                  child: Text(
                                                      '...............................................................',
                                                      textAlign: TextAlign.left,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        color: biru,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                      )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 2, 0, 0),
                                                child: Text('Rp. 10.0000000000',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: biru,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 1, 0, 0),
                                                child: Text('Total USD ',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: biru,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 1, 0, 0),
                                                  child: Text(
                                                      '...............................................................',
                                                      textAlign: TextAlign.left,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        color: biru,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                      )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 2, 0, 0),
                                                child: Text('\$  10.0000000000',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: biru,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 1, 0, 0),
                                                child: Text('Total EUR ',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: biru,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 1, 0, 0),
                                                  child: Text(
                                                      '...............................................................',
                                                      textAlign: TextAlign.left,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        color: biru,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                      )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 2, 0, 0),
                                                child: Text(
                                                    '\u{20B9} 10.0000000000',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: biru,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 1, 0, 0),
                                                child: Text('Total SGD ',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: biru,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 1, 0, 0),
                                                  child: Text(
                                                      '...............................................................',
                                                      textAlign: TextAlign.left,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.roboto(
                                                        fontSize: 10,
                                                        color: biru,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .subtitle1,
                                                      )),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 2, 0, 0),
                                                child: Text(
                                                    '\$\$ 10.0000000000',
                                                    textAlign: TextAlign.left,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                      fontSize: 10,
                                                      color: biru,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .subtitle1,
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ))
                          ],
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kai/fom.dart';

import 'setting.dart';

// ignore: must_be_immutable
class CekList extends StatefulWidget {
  CekList(this.edit, this.data, this.gerbong);
  Map data;
  Map gerbong;
  bool edit;

  @override
  State<CekList> createState() => _CekListState();
}

class _CekListState extends State<CekList> {
  @override
  bool baikValue = false;
  bool serviceValue = true;
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(shrinkWrap: true, children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: (() => Navigator.of(context).pop()),
                  child: Container(
                    width: 45,
                    height: 45,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.02),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: biru,
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFe0f2f1)),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: putih.withOpacity(0.7),
                  shape: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: putih.withOpacity(0),
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text("Kode Gerbang :",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: biru,
                                    fontWeight: FontWeight.w600,
                                    textStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                  )),
                              const Expanded(child: SizedBox()),
                              Text(widget.gerbong["code"] ?? "",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: biru,
                                    fontWeight: FontWeight.w600,
                                    textStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Text("Nama Gerbang :",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: biru,
                                    fontWeight: FontWeight.w600,
                                    textStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                  )),
                              const Expanded(child: SizedBox()),
                              Text(widget.gerbong["name"] ?? "",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: biru,
                                    fontWeight: FontWeight.w600,
                                    textStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                  ))
                            ],
                          ),
                        ),
                        widget.edit
                            ? Expanded(
                                child: Row(
                                  children: [
                                    Text("Pengecek :",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          color: biru,
                                          fontWeight: FontWeight.w600,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        )),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                        widget.gerbong[
                                                "checked_by_user_name"] ??
                                            "",
                                        textAlign: TextAlign.left,
                                        style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          color: biru,
                                          fontWeight: FontWeight.w600,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .subtitle1,
                                        ))
                                  ],
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: putih.withOpacity(0.7),
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: putih.withOpacity(0),
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                              columnSpacing: 10,
                              border: TableBorder
                                  .symmetric(), // Allows to add a border decoration around your table
                              columns: [
                                DataColumn(
                                  label: Expanded(
                                      child: Text(
                                    'No',
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                DataColumn(
                                  label: Expanded(
                                      child: Text(
                                    'Name',
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                DataColumn(
                                  label: Expanded(
                                      child: Text(
                                    'Baik',
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                DataColumn(
                                  label: Expanded(
                                      child: Text(
                                    'Butuh Perbaikan',
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                                DataColumn(
                                  label: Expanded(
                                      child: Text(
                                    'Catatan',
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                              ],
                              rows: widget.edit == true
                                  ? widget.data["data"]["items"]
                                      .map<DataRow>((value) => DataRow(cells: [
                                            DataCell(Center(child: Text('1'))),
                                            DataCell(Text(
                                                value["item_name"].toString(),
                                                textAlign: TextAlign.left)),
                                            DataCell(Center(
                                                child: Text(value[
                                                        "count_good_condition"]
                                                    .toString()))),
                                            DataCell(Center(
                                                child: Text(
                                                    value["count_bad_condition"]
                                                        .toString()))),
                                            // DataCell(CheckboxListTile(
                                            //   value: baikValue,
                                            //   onChanged: (newValue) {
                                            //     setState(() {
                                            //       baikValue = newValue;
                                            //       serviceValue = !newValue;
                                            //     });
                                            //   },
                                            //   controlAffinity: ListTileControlAffinity
                                            //       .leading, //  <-- leading Checkbox
                                            // )),
                                            // DataCell(Center(
                                            //     child: CheckboxListTile(
                                            //   value: serviceValue,
                                            //   onChanged: (newValue) {
                                            //     setState(() {
                                            //       baikValue = !newValue;
                                            //       serviceValue = newValue;
                                            //     });
                                            //   },
                                            //   controlAffinity: ListTileControlAffinity
                                            //       .leading, //  <-- leading Checkbox
                                            // ))),
                                            DataCell(Text(
                                                value["note"].toString(),
                                                textAlign: TextAlign.left)),
                                          ]))
                                      .toList()
                                  : widget.data["data"]
                                      .map<DataRow>((value) => DataRow(cells: [
                                            DataCell(Center(child: Text('1'))),
                                            DataCell(Text(
                                                value["item_name"].toString(),
                                                textAlign: TextAlign.left)),
                                            widget.edit == true
                                                ? DataCell(Center(
                                                    child: Text(value[
                                                            "count_good_condition"]
                                                        .toString())))
                                                : DataCell(CheckboxListTile(
                                                    value: baikValue,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        baikValue = newValue;
                                                        serviceValue =
                                                            !newValue;
                                                      });
                                                    },
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading, //  <-- leading Checkbox
                                                  )),
                                            widget.edit == true
                                                ? DataCell(Center(
                                                    child: Text(value[
                                                            "count_bad_condition"]
                                                        .toString())))
                                                : DataCell(Center(
                                                    child: CheckboxListTile(
                                                    value: serviceValue,
                                                    onChanged: (newValue) {
                                                      setState(() {
                                                        baikValue = !newValue;
                                                        serviceValue = newValue;
                                                      });
                                                    },
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .leading, //  <-- leading Checkbox
                                                  ))),
                                            DataCell(Text(
                                                value["note"].toString(),
                                                textAlign: TextAlign.left)),
                                          ]))
                                      .toList()
                              // [
                              //   DataRow(
                              //cells: [
                              //     DataCell(Center(
                              //         child: Text(widget.data["data"]["items"][0]
                              //                 ["item_type_name"]
                              //             .toString()))),
                              //     DataCell(Center(child: Text('1'))),
                              //     DataCell(CheckboxListTile(
                              //       value: baikValue,
                              //       onChanged: (newValue) {
                              //         setState(() {
                              //           baikValue = newValue;
                              //           serviceValue = !newValue;
                              //         });
                              //       },
                              //       controlAffinity: ListTileControlAffinity
                              //           .leading, //  <-- leading Checkbox
                              //     )),
                              //     DataCell(Center(
                              //         child: CheckboxListTile(
                              //       value: serviceValue,
                              //       onChanged: (newValue) {
                              //         setState(() {
                              //           baikValue = !newValue;
                              //           serviceValue = newValue;
                              //         });
                              //       },
                              //       controlAffinity: ListTileControlAffinity
                              //           .leading, //  <-- leading Checkbox
                              //     ))),
                              //     DataCell(Center(child: Text('5644645')))
                              //   ])
                              // ],
                              ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.edit
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.red[300],
                          ),
                          child: Center(
                            child: Text("Tolak",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w600,
                                  textStyle:
                                      Theme.of(context).textTheme.subtitle1,
                                )),
                          ),
                        )
                      : Container(),
                  Container(width: MediaQuery.of(context).size.width * 0.06),
                  !widget.edit
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: birumuda,
                          ),
                          child: Center(
                            child: Text("Simpan",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w600,
                                  textStyle:
                                      Theme.of(context).textTheme.subtitle1,
                                )),
                          ),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.green[300],
                          ),
                          child: Center(
                            child: Text("Setujui",
                                textAlign: TextAlign.left,
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w600,
                                  textStyle:
                                      Theme.of(context).textTheme.subtitle1,
                                )),
                          ),
                        )
                ],
              )
            ])));
  }
}

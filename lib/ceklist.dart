import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'setting.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(shrinkWrap: true, children: [
              Container(
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
                              Expanded(child: SizedBox()),
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
                              Expanded(child: SizedBox()),
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
                        Expanded(
                          child: Row(
                            children: [
                              Text("Pengecek :",
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    fontSize: 18,
                                    color: biru,
                                    fontWeight: FontWeight.w600,
                                    textStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                  )),
                              Expanded(child: SizedBox()),
                              Text(widget.gerbong["checked_by_user_name"] ?? "",
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
                      ],
                    ),
                  ),
                ),
              ),
              Container(
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
                    child: DataTable(
                      columnSpacing: 7,
                      showCheckboxColumn: true,
                      border: TableBorder
                          .symmetric(), // Allows to add a border decoration around your table
                      columns: [
                        DataColumn(
                          label: Expanded(child: Text('No')),
                        ),
                        DataColumn(
                          label: Expanded(child: Text('Name')),
                        ),
                        DataColumn(
                          label: Center(child: Text('Baik')),
                        ),
                        DataColumn(
                          label: Center(child: Text('Butuh Perbaikan')),
                        ),
                        DataColumn(
                          label: Center(child: Text('Catatan')),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('1'))),
                          DataCell(Center(child: Text('Arshik'))),
                          DataCell(Center(child: Text('5644645'))),
                          DataCell(Center(child: Text('5644645')))
                        ])
                      ],
                    ),
                  ),
                ),
              )
            ])));
  }
}

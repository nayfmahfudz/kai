import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kai/fom.dart';

import '../setting.dart';

navigateToNextScreen(BuildContext context, newScreen) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => newScreen));
}

tinggiAs(context) {
  var pixRatio = MediaQuery.of(context).devicePixelRatio;
  var heightRatio = MediaQuery.of(context).size.height * pixRatio;
  var widthRatio = MediaQuery.of(context).size.width * pixRatio;
  return heightRatio / widthRatio;
}

lebar(context) {
  var pixRatio = MediaQuery.of(context).devicePixelRatio;
  var heightRatio = MediaQuery.of(context).size.height * pixRatio;
  var widthRatio = MediaQuery.of(context).size.width * pixRatio;
  return widthRatio / heightRatio;
}

// List<Widget> rolePegawai(context) {
//   return [statistik(context), jam(context), personal(context), tugas(context)];
// }

// statistik(context) {
//   return GestureDetector(
//     onTap: () => navigateToNextScreen(context, Statistik()),
//     child: Container(
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: biru.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 15), // changes position of shadow
//             ),
//           ],
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           border: Border.all(
//             width: 1,
//             color: Colors.grey.withOpacity(0.3),
//           ),
//           color: putih),
//       child: Padding(
//           padding: EdgeInsets.all(tinggiAs(context) / 0.1),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Expanded(flex: 10, child: Image.asset("assets/chart.png")),
//               SizedBox(
//                 height: 3,
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   "STATISTIK",
//                   style: TextStyle(fontSize: 10),
//                 ),
//               )
//             ],
//           )),
//     ),
//   );
// }

// tugas(context) {
//   return GestureDetector(
//     onTap: () => navigateToNextScreen(context, Tugas()),
//     child: Container(
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: biru.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 15), // changes position of shadow
//             ),
//           ],
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           border: Border.all(
//             width: 1,
//             color: Colors.grey.withOpacity(0.3),
//           ),
//           color: putih),
//       child: Padding(
//           padding: EdgeInsets.all(tinggiAs(context) / 0.1),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Expanded(flex: 10, child: Image.asset("assets/task.png")),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Text(
//                     "TUGAS",
//                     style: TextStyle(fontSize: 10),
//                   ),
//                 )
//               ])),
//     ),
//   );
// }

// personal(context) {
//   return GestureDetector(
//     onTap: () => navigateToNextScreen(context, Personal()),
//     child: Container(
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: biru.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 15), // changes position of shadow
//             ),
//           ],
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           border: Border.all(
//             width: 1,
//             color: Colors.grey.withOpacity(0.3),
//           ),
//           color: putih),
//       child: Padding(
//           padding: EdgeInsets.all(tinggiAs(context) / 0.1),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Expanded(flex: 10, child: Image.asset("assets/worker.png")),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Text(
//                     "PERSONAL",
//                     style: TextStyle(fontSize: 10),
//                   ),
//                 )
//               ])),
//     ),
//   );
// }

// jam(context) {
//   return GestureDetector(
//     onTap: () => navigateToNextScreen(context, Jam()),
//     child: Container(
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: biru.withOpacity(0.5),
//               spreadRadius: 5,
//               blurRadius: 7,
//               offset: Offset(0, 15), // changes position of shadow
//             ),
//           ],
//           borderRadius: BorderRadius.all(Radius.circular(10.0)),
//           border: Border.all(
//             width: 1,
//             color: Colors.grey.withOpacity(0.3),
//           ),
//           color: putih),
//       child: Padding(
//           padding: EdgeInsets.all(tinggiAs(context) / 0.1),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Expanded(flex: 10, child: Image.asset("assets/clock.png")),
//                 SizedBox(
//                   height: 3,
//                 ),
//                 Expanded(
//                   flex: 3,
//                   child: Text(
//                     "JAM",
//                     style: TextStyle(fontSize: 10),
//                   ),
//                 )
//               ])),
//     ),
//   );
// }
Widget search(TextEditingController controller, BuildContext context) {
  return Container(
      child: TextFormField(
    controller: controller,
    validator: (value) {
      if (value != null && value.length < 3)
        return 'Nama Harus diisi minimal 3 kata';
      else
        return null;
    },
    autofocus: false,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      hintText: 'Cari Gerbong',
      contentPadding: EdgeInsets.all(20),
    ),
  ));
}

nama(TextEditingController controller, BuildContext context) {
  return Container(
      child: TextFormField(
    controller: controller,
    validator: (value) {
      if (value != null && value.length < 3)
        return 'Nama Harus diisi minimal 3 kata';
      else
        return null;
    },
    autofocus: false,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      hintText: 'Username',
      contentPadding: EdgeInsets.all(20),
    ),
  ));
}

password(TextEditingController controller, bool hide) {
  return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => Container(
            child: TextFormField(
                validator: (value) {
                  if (value != null && value.length < 5)
                    return 'Password harus diisi Minimal 5 ';
                  else
                    return null;
                },
                autofocus: false,
                controller: controller,
                obscureText: hide ? true : false,
                decoration: InputDecoration(
                  hintText: ' Password',
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(
                        hide ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          controller;
                          hide = !hide;
                        });
                      }),
                )),
          ));
}

class ReturnValueToParent extends StatelessWidget {
  Function myNumber;
  String selected;
  String aktif;
  String tidakAktif;
  String judul;
  ReturnValueToParent(
      this.myNumber, this.selected, this.aktif, this.tidakAktif, this.judul);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.11,
      width: MediaQuery.of(context).size.height * 0.055,
      child: GestureDetector(
          onTap: () {
            selected = judul;
          },
          child: selected == judul
              ? Column(
                  children: [
                    Image.asset(aktif, fit: BoxFit.contain),
                    Text(judul,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: biru,
                          fontWeight: FontWeight.w400,
                          textStyle: Theme.of(context).textTheme.subtitle1,
                        )),
                  ],
                )
              : Column(
                  children: [
                    Image.asset(tidakAktif, fit: BoxFit.contain),
                    Text(judul,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: biru,
                          fontWeight: FontWeight.w400,
                          textStyle: Theme.of(context).textTheme.subtitle1,
                        )),
                  ],
                )),
    ));
  }
}

menuUtama(BuildContext context, String selected, String aktif,
    String tidakAktif, String judul, Function fungsi) {
  return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) => Expanded(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
            width: MediaQuery.of(context).size.height * 0.055,
            child: GestureDetector(
                onTap: () => fungsi,
                child: selected == judul
                    ? Column(
                        children: [
                          Image.asset(aktif, fit: BoxFit.contain),
                          Text(judul,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: biru,
                                fontWeight: FontWeight.w400,
                                textStyle:
                                    Theme.of(context).textTheme.subtitle1,
                              )),
                        ],
                      )
                    : Column(
                        children: [
                          Image.asset(tidakAktif, fit: BoxFit.contain),
                          Text(judul,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                color: biru,
                                fontWeight: FontWeight.w400,
                                textStyle:
                                    Theme.of(context).textTheme.subtitle1,
                              )),
                        ],
                      )),
          )));
}
// var alamat = StatefulBuilder(
//     builder: (BuildContext context, StateSetter setState) => Container(
//             child: TextFormField(
//           controller: alamatinputcontroller,
//           validator: validalamat,
//           onSaved: (String value) {
//             _alamat = value;
//           },
//           autofocus: false,
//           decoration: InputDecoration(
//             suffixIcon: IconButton(
//               icon: Icon(Icons.home),
//             ),
//             hintText: 'Alamat ',
//             contentPadding: EdgeInsets.all(20),
//             border: Provider.of<Restapi>(context).getboolean()
//                 ? OutlineInputBorder()
//                 : null,
//           ),
//         )));
// var nomor = StatefulBuilder(
//     builder: (BuildContext context, StateSetter setState) => Container(
//             child: TextFormField(
//           keyboardType: TextInputType.phone,
//           controller: nomorinputcontroller,
//           validator: validnomor,
//           autofocus: false,
//           decoration: InputDecoration(
//             hintText: ' Nomor Telepon',
//             contentPadding: EdgeInsets.all(20),
//             border: Provider.of<Restapi>(context).getboolean()
//                 ? OutlineInputBorder()
//                 : null,
//             suffixIcon: IconButton(icon: Icon(Icons.phone_android)),
//           ),
//         )));
// void gberhasil(BuildContext context) => showDialog(
//     context: context,
//     builder: (context) => Center(
//           child: AlertDialog(
//             content: Text(
//               "Gagal Join",
//               textAlign: TextAlign.center,
//               style:
//                   TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
//             ),
//             elevation: 3,
// //                actionsPadding: EdgeInsets.only(right: 28),

//             actions: <Widget>[Center(child: okButton)],
//           ),
//         ));
// void jberhasil(BuildContext context) => showDialog(
//     context: context,
//     builder: (context) => Center(
//           child: AlertDialog(
//             content: Text(
//               "Berhasil Join",
//               textAlign: TextAlign.center,
//               style:
//                   TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
//             ),
//             elevation: 3,
// //                actionsPadding: EdgeInsets.only(right: 28),

//             actions: <Widget>[Center(child: okButton)],
//           ),
//         ));
// void uberhasil(BuildContext context) => showDialog(
//     context: context,
//     builder: (context) => Center(
//           child: AlertDialog(
//             content: Text(
//               "Berhasil Join",
//               textAlign: TextAlign.center,
//               style:
//                   TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
//             ),
//             elevation: 3,
// //                actionsPadding: EdgeInsets.only(right: 28),

//             actions: <Widget>[Center(child: okButton)],
//           ),
//         ));
// int switchControl;

// String hasil;

void berhasil(BuildContext context, String text) => showDialog(
    context: context,
    builder: (context) => Center(
          child: AlertDialog(
            content: Text(
              text,
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            elevation: 3,
//                actionsPadding: EdgeInsets.only(right: 28),

            actions: <Widget>[okButton],
          ),
        ));
// void keluar(BuildContext context) => showDialog(
//     context: context,
//     builder: (context) => Center(
//           child: AlertDialog(
//             content: Text(
//               "Mau Keluar?",
//               textAlign: TextAlign.center,
//               style:
//                   TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
//             ),
//             elevation: 3,
// //                actionsPadding: EdgeInsets.only(right: 28),

//             actions: <Widget>[
//               Row(
//                 children: <Widget>[
//                   keluaryaButton,
//                   SizedBox(
//                     width: 20,
//                   ),
//                   keluartidakButton
//                 ],
//               )
//             ],
//           ),
//         ));

alarm(BuildContext context, String text) => showDialog(
    context: context,
    builder: (context) => Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    border: Border.all(
                      width: 1,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    color: putih),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        child: Center(
                          child: DefaultTextStyle(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            child: Text(
                              text,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Center(child: okButton))
                  ],
                )),
          ),
        ));
Loading(BuildContext context) {
  Future.delayed(Duration(seconds: 2), () {
    return Container();
  });
  return showDialog(
      context: context,
      builder: (context) => Center(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      Center(
                          child: Text(
                        "Tunggu Sebentar",
                        style: TextStyle(color: biru),
                      ))
                    ],
                  )),
            ),
          ));
}

// var keluaryaButton = Builder(
//   builder: (BuildContext context) => Material(
//     shadowColor: Color.fromRGBO(237, 155, 12, 1),
//     child: MaterialButton(
//       minWidth: 100.0,
//       height: 42.0,
//       onPressed: () {
//         dbHelper.deleteUser();
//         Navigator.pushNamed(context, "/Login");
//       },
//       color: Color.fromRGBO(237, 155, 12, 1),
//       child: Text(
//         'Ya',
//         style: TextStyle(
//           color: Colors.white,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ),
//   ),
// );
// var keluartidakButton = Builder(
//   builder: (BuildContext context) => Material(
//     shadowColor: Color.fromRGBO(237, 155, 12, 1),
//     child: MaterialButton(
//       minWidth: 100.0,
//       height: 42.0,
//       onPressed: () {
//         Navigator.pop(context);
//       },
//       color: Color.fromRGBO(237, 155, 12, 1),
//       child: Text(
//         'Tidak',
//         style: TextStyle(
//           color: Colors.white,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ),
//   ),
// );
var okButton = Builder(
  builder: (BuildContext context) => Material(
    shadowColor: Colors.grey,
    child: MaterialButton(
      minWidth: 200.0,
      height: 42.0,
      onPressed: () {
        Navigator.pop(context);
      },
      color: biru,
      child: Text(
        'OK',
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ),
);
// // var gantiButton = Builder(
// //     builder: (BuildContext context) => Padding(
// //           padding: EdgeInsets.only(left: 30),
// //           child: Align(
// //             alignment: Alignment.bottomCenter,
// //             child: SizedBox(
// //               width: MediaQuery.of(context).size.width,
// //               child: RaisedButton(
// //                 // padding: EdgeInsets.all(10),
// //                 onPressed: () {
// //                   if (formKey2.currentState.validate()) {
// //                     formKey2.currentState.save();
// //                     gantipass(context, passvrinputcontroller.text);
// //                   } else {
// //                     StatefulBuilder(builder: (context, setState) {
// //                       setState(() {
// //                         autoValidate = true;
// //                       });
// //                     });
// //                   }
// //                 },
// //                 child: const Text('Verifikasi', style: TextStyle(fontSize: 20)),
// //                 color: Color.fromRGBO(237, 155, 12, 1),
// //                 textColor: Colors.white,
// //                 // elevation: 5,
// //               ),
// //             ),
// //           ),
// //           // ),
// //         ));

// //    Material(
// //     borderRadius: BorderRadius.circular(60.0),
// //     shadowColor: Color.fromRGBO(237, 155, 12, 1),
// //     // elevation: 5.0,
// //     child: MaterialButton(
// //         minWidth: 200.0,
// //         height: 42.0,
// //         onPressed: () {

// //   if (formKey2.currentState.validate()) {
// //     formKey2.currentState.save();
// //     gantipass(context, _passver);
// //   } else {
// //     StatefulBuilder(builder: (context, setState) {
// //       setState(() {
// //         autoValidate = true;
// //       });
// //     });
// //   }},
// //  color: Color.fromRGBO(237, 155, 12, 1),
// //       child: Text('Verifikasi', style: TextStyle(color: Colors.white)),

// //         ),
// //   ),
// // );
// var joinButton = Builder(
//   builder: (BuildContext context) => Material(
//     borderRadius: BorderRadius.circular(60.0),
//     shadowColor: Color.fromRGBO(237, 155, 12, 1),
//     // elevation: 5.0,
//     child: MaterialButton(
//       minWidth: 200.0,
//       height: 42.0,
//       onPressed: () {
//         joinagenda(context);
//       },
//       color: Color.fromRGBO(237, 155, 12, 1),
//       child: Text('Sign In', style: TextStyle(color: Colors.white)),
//     ),
//   ),
// );

// var signButton = Builder(
//   builder: (BuildContext context) => Material(
//     borderRadius: BorderRadius.circular(60.0),
//     shadowColor: Color.fromRGBO(237, 155, 12, 1),
//     // elevation: 5.0,
//     child: MaterialButton(
//       minWidth: 200.0,
//       height: 42.0,
//       onPressed: () {
//         if (formKey1.currentState.validate()) {
//           formKey1.currentState.save();
//           postSignUp(
//               context,
//               namainputcontroller.text,
//               emailinputcontroller.text,
//               passinputcontroller.text,
//               alamatinputcontroller.text,
//               nomorinputcontroller.text);
//         } else {
//           StatefulBuilder(builder: (context, setState) {
//             setState(() {
//               autoValidate = true;
//             });
//           });
//         }
//       },
//       color: Color.fromRGBO(237, 155, 12, 1),
//       child: Text('Sign Up', style: TextStyle(color: Colors.white)),
//     ),
//   ),
// );

// final email = StatefulBuilder(
//     builder: (BuildContext context, StateSetter setState) => Container(
//             child: TextFormField(
//           validator: validemail,
//           onSaved: (String value) {
//             _email = value;
//           },
//           controller: emailinputcontroller,
//           keyboardType: TextInputType.emailAddress,
//           autofocus: false,
//           // initialValue: "Masukan Username atau Email",
//           decoration: InputDecoration(
//             suffixIcon: IconButton(icon: Icon(Icons.keyboard)),
//             hintText: 'Email',
//             contentPadding: EdgeInsets.all(20),
//             border: Provider.of<Restapi>(context).getboolean()
//                 ? OutlineInputBorder()
//                 : null,
//           ),
//         )));
// // final

// bool passwordVisible = true;

// Widget loginButton(String text, Color warna, Color textwarna) {
//   return Builder(
//     builder: (context) => Container(
//       height: tinggiAs(context) * 27,
//       child: Center(
//           child: Text(text,
//               style: GoogleFonts.roboto(
//                 fontSize: 16,
//                 color: textwarna,
//                 fontWeight: FontWeight.w500,
//                 textStyle: Theme.of(context).textTheme.subtitle1,
//               ))),
//       decoration: BoxDecoration(
//         color: warna,
//         borderRadius: BorderRadius.all(Radius.circular(10.0)),
//         // shadowColor: Color.fromRGBO(237, 155, 12, 1),
//       ),
//       // elevation: 5.0,
//     ),
//   );
// }

// text(String text, Function to) {
//   return Builder(
//       builder: (BuildContext context) => GestureDetector(
//             child: Text(
//               text,
//               style: TextStyle(color: Colors.black54),
//             ),
//             onTap: () {
//               to;
//             },
//           ));
// }

// final editButton = Builder(
//   builder: (BuildContext context) => Material(
//     shadowColor: Color.fromRGBO(237, 155, 12, 1),
//     // elevation: 5.0,
//     child: MaterialButton(
//       minWidth: 200.0,
//       height: 42.0,
//       onPressed: () {
//         edituser(context, namainputcontroller.text, emailinputcontroller.text,
//             alamatinputcontroller.text, nomorinputcontroller.text);
//       },
//       color: Color.fromRGBO(237, 155, 12, 1),
//       child: Text('Edit', style: TextStyle(color: Colors.white)),
//     ),
//   ),
// );

// // void settingModalBottomSheet(BuildContext context) => showModalBottomSheet(
// //     context: context,
// //     builder: (context) {
// //       return Iconbottom();
// //     });

// var searchInputLabel = StatefulBuilder(
//     builder: (BuildContext context, StateSetter setState) => Container(
//           child: TextFormField(
// //          validator: validKeyword,
//               autofocus: false,
// //          onSaved: (value) {
// //            _keyword = value;
// //          },
// //          controller: keywordInputController,
//               onTap: () {
//                 Navigator.of(context).pushNamed("/Search");
//               },
//               decoration: InputDecoration(
//                 hintText: ' Search...',
//                 contentPadding: EdgeInsets.all(20),
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                     icon: Icon(
//                       Icons.search,
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pushNamed("/Search");
//                     }),
//               )),
//         ));

// var searchInput = StatefulBuilder(
//     builder: (BuildContext context, StateSetter setState) => Container(
//           child: TextFormField(
// //          validator: validKeyword,
//               autofocus: false,
// //          onSaved: (value) {
// //            _keyword = value;
// //          },
// //          controller: keywordInputController,
//               onTap: () {
//                 Navigator.of(context).pushNamed("/Search");
//               },
//               decoration: InputDecoration(
//                 hintText: ' Search...',
//                 contentPadding: EdgeInsets.all(20),
//                 border: OutlineInputBorder(),
//                 suffixIcon: IconButton(
//                     icon: Icon(
//                       Icons.search,
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pushNamed("/Search");
//                     }),
//               )),
//         ));

// //String validKeyword(String value) {
// //  if (value.length < 5) return 'Minimum keyword char is 3';
// //}

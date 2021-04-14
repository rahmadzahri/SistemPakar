import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:sistem_pakar/kesehatan_tambak.dart';
import 'package:sistem_pakar/log_data.dart';

class TampilanAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.green);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white38,
        child: Column(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height * 0.4,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  Text('Selamat Datang Di Aplikasi Sistem Pakar',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        elevation: MaterialStateProperty.all<double>(15),
                        shadowColor: MaterialStateProperty.all<Color>(
                          Colors.black,
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    child: Text(
                      "Kondisi Tambak",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return KesehatanTambak();
                      }));
                    },
                  ),
                ],
              ),
            ),
            TextButton(
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                  elevation: MaterialStateProperty.all<double>(15),
                  shadowColor: MaterialStateProperty.all<Color>(
                    Colors.black,
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              child: Text(
                
                "Riwayat Data Tambak",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LogData();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}

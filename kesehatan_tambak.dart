import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:sistem_pakar/penyebab.dart';
import 'package:sistem_pakar/solusi.dart';
import 'kondisi.dart';
import 'sensor.dart';

class KesehatanTambak extends StatefulWidget {
  @override
  _MonitoringState createState() => _MonitoringState();
}

class _MonitoringState extends State<KesehatanTambak> {
  Color colorCondition;
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('sensor');

  Color conditionColor(Tambak tbk) {
    if ('${tbk.statusTambak}' == 'Sehat') {
      return Colors.black;
    } else if ('${tbk.statusTambak}' == 'Tidak Sehat') {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainScaffold();
  }

  Widget mainScaffold() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Kondisi Tambak Udang"),
      ),
      body: StreamBuilder(
          stream: databaseReference.onValue,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                !snapshot.hasError &&
                snapshot.data.snapshot.value != null) {
              var tbk =
                  Tambak.fromJson(snapshot.data.snapshot.value['realtime']);
              var id = Kondisi().keadaanTambak(tbk);
              debugPrint(id.toString());

              return tampilData(tbk, id);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget tampilData(Tambak tbk, id) {
    Color coba = colorCondition;
    print(coba.toString());
    return Scaffold(
      backgroundColor: Color(0xFF21BFBD),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 150,
              width: 150,
              child: LiquidCircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.lightGreenAccent),
                value: tbk.ketinggianAir / 120,
                center: Text(
                  "Ketinggian Air = "
                  '${tbk.ketinggianAir}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                borderColor: Colors.black,
                borderWidth: 1.0,
                direction: Axis.vertical,
              ),
            ),
            Container(
              width: double.infinity,
              height: 65,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: LiquidLinearProgressIndicator(
                borderRadius: 20.0,
                value: tbk.pHAir / 10,
                valueColor: AlwaysStoppedAnimation(Colors.amber),
                center: Text(
                  "pH Air = "
                  '${tbk.pHAir}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                direction: Axis.horizontal,
                backgroundColor: Colors.amber[50],
              ),
            ),
            Container(
              height: 150,
              width: 150,
              child: LiquidCircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.lightGreenAccent),
                value: tbk.salinitasAir / 40,
                center: Text(
                  "Salinitas Air = "
                  '${tbk.salinitasAir}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
                borderColor: Colors.black,
                borderWidth: 1.0,
                direction: Axis.vertical,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: tbk.statusTambak == "Sehat"
                      ? Colors.greenAccent[700]
                      : Colors.redAccent[700],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Status Tambak = ${tbk.statusTambak}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          elevation: MaterialStateProperty.all<double>(10),
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
                        "Penyebab ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Penyebab(status: id.toString())),
                        );
                      }),
                  TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Colors.white),
                          elevation: MaterialStateProperty.all<double>(10),
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
                        "Solusi ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Solusi(status: id.toString())),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

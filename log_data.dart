import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sistem_pakar/sensor.dart';

class LogData extends StatefulWidget {

  @override
  _LogDataState createState() => _LogDataState();
}

class _LogDataState extends State<LogData> {
  String log = 'log';

  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('sensor');


  @override
  Widget build(BuildContext context) {
    return mainScaffold();
  }

  Widget mainScaffold() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Data Riwayat Tambak"),
      ),
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: databaseReference.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData &&
              !snapshot.hasError &&
              snapshot.data.snapshot.value != null) {
            var _log = Tambak.fromJson(snapshot.data.snapshot.value[log]);
            return tampilData(_log);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget tampilData(Tambak sensor) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: [
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              shadowColor: Colors.black,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      '${sensor.tanggal} / ${sensor.jam}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Nilai pH: ${sensor.pHAir}',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Nilai Air: ${sensor.ketinggianAir}',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Nilai Salinitas: ${sensor.salinitasAir}',
                      style: TextStyle(color: Colors.black, fontSize: 20),
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

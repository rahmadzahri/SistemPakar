import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'sensor.dart';

class KesehatanTambak extends StatefulWidget {
  @override
  _MonitoringState createState() => _MonitoringState();
}

AnimationController animationController;

final percentage = animationController.value * 100;

class _MonitoringState extends State<KesehatanTambak> {
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.reference().child('sensor');
  DatabaseReference kesehatanTambak =
      FirebaseDatabase.instance.reference().child('sensor').child('realtime');

  void sangatTidakSehat() {
    kesehatanTambak.update({'status_tambak': 'sangatTidakSehat'});
  }

  void kurangSehat() {
    kesehatanTambak.update({'status_tambak': 'Kurang Sehat'});
  }

  void sehat() {
    kesehatanTambak.update({'status_tambak': 'Sehat'});
  }

  void sangatSehat() {
    kesehatanTambak.update({'status_tambak': 'sangat Sehat'});
  }

  void keadaanTambak(Tambak tbk) async {
    if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir == 0 &&
        tbk.ketinggianAir < 80) {
      sangatTidakSehat();
    } else if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir <= 80 &&
        tbk.ketinggianAir < 120) {
      kurangSehat();
    } else if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir == 200) {
      sangatTidakSehat();
    } else if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir == 0 &&
        tbk.ketinggianAir <= 80) {
      kurangSehat();
    } else if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33 &&
        tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120) {
      sehat();
    } else if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir >= 200) {
      kurangSehat();
    } else if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir >= 200) {
      sehat();
    } else if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir >= 40 &&
        tbk.ketinggianAir == 0 &&
        tbk.ketinggianAir < 80) {
      sangatTidakSehat();
    } else if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir >= 40 &&
        tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120) {
      kurangSehat();
    } else if (tbk.pHAir == 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir >= 200) {
      sangatTidakSehat();
    } else if (tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir == 0 &&
        tbk.ketinggianAir < 80) {
      kurangSehat();
    } else if (tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120) {
      sehat();
    } else if (tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir >= 200) {
      kurangSehat();
    } else if (tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33 &&
        tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120) {
      sangatSehat();
    } else if (tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir >= 200) {
      sehat();
    } else if (tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir >= 40 &&
        tbk.ketinggianAir == 0 &&
        tbk.ketinggianAir < 80) {
      kurangSehat();
    } else if (tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir >= 40 &&
        tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120) {
      sehat();
    } else if (tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir >= 40 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir >= 200) {
      kurangSehat();
    } else if (tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir == 0 &&
        tbk.ketinggianAir < 80) {
      sangatTidakSehat();
    } else if (tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120) {
      kurangSehat();
    } else if (tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir == 0 &&
        tbk.salinitasAir < 30 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir >= 200) {
      sangatTidakSehat();
    } else if (tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33 &&
        tbk.ketinggianAir == 0 &&
        tbk.ketinggianAir < 80) {
      kurangSehat();
    } else if (tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33 &&
        tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120) {
      sehat();
    } else if (tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir >= 200) {
      kurangSehat();
    } else if (tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir >= 40 &&
        tbk.ketinggianAir == 0 &&
        tbk.ketinggianAir < 80) {
      sangatTidakSehat();
    } else if (tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir >= 40 &&
        tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120) {
      kurangSehat();
    } else if (tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir >= 40 &&
        tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir >= 200) {
      sangatTidakSehat();
    } else {
      kurangSehat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainScaffold();
  }

  Widget mainScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambak udang"),
      ),
      body: StreamBuilder(
          stream: databaseReference.onValue,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                !snapshot.hasError &&
                snapshot.data.snapshot.value != null) {
              var tbk =
                  Tambak.fromJson(snapshot.data.snapshot.value['realtime']);
              keadaanTambak(tbk);
              return tampilData(tbk);
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  Widget tampilData(Tambak tbk) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: double.infinity,
              height: 85,
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: LiquidLinearProgressIndicator(
                borderRadius: 20.0,
                valueColor: AlwaysStoppedAnimation(Colors.amber),
                center: Text(
                  '${tbk.pHAir}%',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                direction: Axis.horizontal,
                backgroundColor: Colors.grey.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

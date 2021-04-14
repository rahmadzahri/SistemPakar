import 'package:firebase_database/firebase_database.dart';
import 'package:sistem_pakar/sensor.dart';

class Kondisi {
  DatabaseReference kesehatanTambak =
      FirebaseDatabase.instance.reference().child('sensor').child('realtime');

  void tidakSehat() {
    kesehatanTambak.update({'status_tambak': 'Tidak Sehat'});
  }

  void sehat() {
    kesehatanTambak.update({'status_tambak': 'Sehat'});
  }


  keadaanTambak(Tambak tbk) {
    if (tbk.ketinggianAir >= 0 &&
        tbk.ketinggianAir < 80 &&
        tbk.pHAir >= 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 1;
    } else if (tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120 &&
        tbk.pHAir >= 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 2;
    } else if (tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir <= 200 &&
        tbk.pHAir >= 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 3;
    } else if (tbk.ketinggianAir >= 0 &&
        tbk.ketinggianAir < 80 &&
        tbk.pHAir >= 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33) {
      tidakSehat();
      return 4;
    } else if (tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120 &&
        tbk.pHAir >= 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33) {
      tidakSehat();
      return 5;
    } else if (tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir <= 200 &&
        tbk.pHAir >= 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33) {
      tidakSehat();
      return 6;
    } else if (tbk.ketinggianAir >= 0 &&
        tbk.ketinggianAir < 80 &&
        tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33) {
      tidakSehat();
      return 7;
    } else if (tbk.ketinggianAir >= 0 &&
        tbk.ketinggianAir < 80 &&
        tbk.pHAir >= 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir <= 40) {
      tidakSehat();
      return 8;
    } else if (tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120 &&
        tbk.pHAir >= 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir <= 40) {
      tidakSehat();
      return 9;
    } else if (tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir <= 200 &&
        tbk.pHAir >= 0 &&
        tbk.pHAir < 7.5 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 10;
    } else if (tbk.ketinggianAir >= 0 &&
        tbk.ketinggianAir < 80 &&
        tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 11;
    } else if (tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120 &&
        tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 12;
    } else if (tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir <= 200 &&
        tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 13;
    } else if (tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120 &&
        tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33) {
      sehat();
      return 14;
    } else if (tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir <= 200 &&
        tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33) {
      tidakSehat();
      return 15;
    } else if (tbk.ketinggianAir >= 0 &&
        tbk.ketinggianAir < 80 &&
        tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir <= 40) {
      tidakSehat();
      return 16;
    } else if (tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120 &&
        tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir <= 40) {
      tidakSehat();
      return 17;
    } else if (tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir <= 200 &&
        tbk.pHAir >= 7.5 &&
        tbk.pHAir <= 8.5 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir <= 40) {
      tidakSehat();
      return 18;
    } else if (tbk.ketinggianAir >= 0 &&
        tbk.ketinggianAir < 80 &&
        tbk.pHAir > 8.5 &&
        tbk.pHAir <= 15 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 19;
    } else if (tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120 &&
        tbk.pHAir > 8.5 &&
        tbk.pHAir <= 15 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 20;
    } else if (tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir <= 200 &&
        tbk.pHAir > 8.5 &&
        tbk.pHAir >= 15 &&
        tbk.salinitasAir >= 0 &&
        tbk.salinitasAir < 30) {
      tidakSehat();
      return 21;
    } else if (tbk.ketinggianAir >= 0 &&
        tbk.ketinggianAir < 80 &&
        tbk.pHAir > 8.5 &&
        tbk.pHAir <= 15 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33) {
      tidakSehat();
      return 22;
    } else if (tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120 &&
        tbk.pHAir > 8.5 &&
        tbk.pHAir <= 15 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33) {
      tidakSehat();
      return 23;
    } else if (tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir <= 200 &&
        tbk.pHAir > 8.5 &&
        tbk.pHAir <= 15 &&
        tbk.salinitasAir >= 30 &&
        tbk.salinitasAir <= 33) {
      tidakSehat();
      return 24;
    } else if (tbk.ketinggianAir >= 0 &&
        tbk.ketinggianAir < 80 &&
        tbk.pHAir > 8.5 &&
        tbk.pHAir <= 15 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir <= 40) {
      tidakSehat();
      return 25;
    } else if (tbk.ketinggianAir >= 80 &&
        tbk.ketinggianAir <= 120 &&
        tbk.pHAir > 8.5 &&
        tbk.pHAir <= 15 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir <= 40) {
      tidakSehat();
      return 26;
    } else if (tbk.ketinggianAir > 120 &&
        tbk.ketinggianAir <= 200 &&
        tbk.pHAir > 8.5 &&
        tbk.pHAir <= 15 &&
        tbk.salinitasAir > 33 &&
        tbk.salinitasAir <= 40) {
      tidakSehat();
      return 27;
    } else {}
  }
}

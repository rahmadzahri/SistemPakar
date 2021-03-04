import 'package:flutter/material.dart';
import 'package:sistem_pakar/kesehatan_tambak.dart';
//import 'penyakit_udang.dart';
//import 'tentang_udang.dart';

class TampilanAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selamat Datang")
      ),
     body: Container(
       child: Center(
         child: Column(
           children: [
            RaisedButton(
              child: Text("Kondisi Tambak"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return KesehatanTambak();
                }));
              },
            ),
           ],
         ),
       ),
     ),
    );
  }
}
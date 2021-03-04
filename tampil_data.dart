import 'package:flutter/material.dart';

class TampilanAwal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kualitas Tambak"),
      ),
      body:Container(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          value: 5,
        ),
      ),
    );
  }
}
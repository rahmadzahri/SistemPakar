import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Penyebab extends StatefulWidget {
  final String status;
  Penyebab({Key key, @required this.status}) : super(key: key);
  @override
  _PenyebabState createState() => _PenyebabState(status);
}

class _PenyebabState extends State<Penyebab> {
  String status;
  String penyebabA = "";
  String penyebabB = "";
  String penyebabC = "";

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  _PenyebabState(this.status);
  void getData() {
    databaseReference
        .child("sensor")
        .child("status")
        .child(status)
        .once()
        .then((DataSnapshot value) {
      setState(() {
        penyebabA = value.value["penyebabA"];
        penyebabB = value.value["penyebabB"];
        penyebabC = value.value["penyebabC"];
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Penyebab"),
      ),
      body: Container(
        color: Color(0xFF21BFBD),
        child: ListView(
          children: [
            penyebabA != ""
                ? Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    elevation: 10,
                    child: Center(
                      child: Text(
                        penyebabA,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : Text(""),
            penyebabB != ""
                ? Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    elevation: 10,
                    child: Center(
                      child: Text(
                        penyebabB,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : Text(""),
            penyebabC != ""
                ? Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    elevation: 10,
                    child: Center(
                      child: Text(
                        penyebabC,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : Text(""),
          ],
        ),
      ),
    );
  }
}

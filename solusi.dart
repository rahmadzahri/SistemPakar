import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Solusi extends StatefulWidget {
  final String status;
  Solusi({Key key, @required this.status}) : super(key: key);
  @override
  _SolusiState createState() => _SolusiState(status);
}

class _SolusiState extends State<Solusi> {
  String status;
  String solusiA = "";
  String solusiB = "";
  String solusiC = "";

  DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  _SolusiState(this.status);
  void getData() {
    databaseReference
        .child("sensor")
        .child("status")
        .child(status)
        .once()
        .then((DataSnapshot value) {
      setState(() {
        solusiA = value.value["solusiA"];
        solusiB = value.value["solusiB"];
        solusiC = value.value["solusiC"];
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
        title: Text("Solusi"),
      ),
      body: Container(
        color: Color(0xFF21BFBD),
        child: ListView(
          children: [
            solusiA != ""
                ? Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    elevation: 10,
                    child: Center(
                      child: Text(
                        solusiA,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : Text(""),
            solusiB != ""
                ? Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    elevation: 10,
                    child: Center(
                      child: Text(
                        solusiB,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                : Text(""),
            solusiC != ""
                ? Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    elevation: 10,
                    child: Center(
                      child: Text(
                        solusiC,
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

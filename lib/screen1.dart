import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_bmi_app/data/data.dart';

Color activeColor = Color(0xFF1D1F33);

class ResultScreen extends StatelessWidget {
  final Data data;

  ResultScreen({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
        backgroundColor: Color(0xFF090C22),
      ),
      body: SafeArea(child: Results(data: data)),
    );
  }
}

class Results extends StatefulWidget {
  Results({@required this.data});

  final Data data;

  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              "Your result",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: activeColor,
            ),
            margin: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.data.bmi.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 65.0,
                  ),
                ),
                Text(
                  widget.data.getResults(),
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 65.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(3),
                  topLeft: Radius.circular(3),
                ),
                color: Color(0xFFEA1556),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Text(
                    "RE CALCULATE BMI",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

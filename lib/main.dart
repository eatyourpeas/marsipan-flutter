import 'dart:ui';

import 'colours.dart';
import 'package:flutter/material.dart';
import 'package:marsipan/risklist.dart';
import 'package:marsipan/percentagemedianbmicalculator.dart';
import 'package:marsipan/adultbmicalculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MEED',
        theme: ThemeData(
            primarySwatch: marsipanDarkGrey,
            backgroundColor: marsipanLightGrey.shade600,
            fontFamily: 'OpenSans'),
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: new RichText(
              text: new TextSpan(children: <TextSpan>[
        new TextSpan(
            text: 'M', style: TextStyle(color: Colors.red, fontSize: 24)),
        new TextSpan(
            text: 'E', style: TextStyle(color: Colors.amber, fontSize: 24)),
        new TextSpan(
            text: 'E', style: TextStyle(color: Colors.green, fontSize: 24)),
        new TextSpan(
            text: 'D', style: TextStyle(color: Colors.blue, fontSize: 24)),
      ]))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new RichText(
                    text: new TextSpan(children: <TextSpan>[
                  new TextSpan(
                      text: 'M',
                      style: TextStyle(color: Colors.red, fontSize: 72)),
                  new TextSpan(
                      text: 'E',
                      style: TextStyle(color: Colors.amber, fontSize: 72)),
                  new TextSpan(
                      text: 'E',
                      style: TextStyle(color: Colors.green, fontSize: 72)),
                  new TextSpan(
                      text: 'D',
                      style: TextStyle(color: Colors.blue, fontSize: 72)),
                ])),
                Text('Managing Emergencies in Eating Disorders')
              ],
            ),
            ElevatedButton(
              child: Text(
                'Risk Assessment Tool',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RiskAssessmentRoute()));
              },
            ),
            ElevatedButton(
              child: Text(
                'Percentage Median BMI Calculator',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.amber),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PercentageMedianBMICalculatorRoute()));
              },
            ),
            ElevatedButton(
              child: Text(
                'BMI Calculator for over 18ys',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdultBMICalculatorRoute()));
              },
            ),
            ElevatedButton(
              child: Text(
                'Risk Tool for over 18ys',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AdultBMICalculatorRoute()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

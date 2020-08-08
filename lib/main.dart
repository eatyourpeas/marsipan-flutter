import 'colours.dart';
import 'package:flutter/material.dart';
import 'package:marsipan/risklist.dart';
import 'package:marsipan/percentagemedianbmicalculator.dart';
import 'package:marsipan/RiskWheel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaRSiPAN',
      theme: ThemeData(
        primarySwatch: marsipanDarkGrey,
        backgroundColor: marsipanLightGrey,
        fontFamily: 'OpenSans'
      ),
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new RichText(text:
        new TextSpan(
          children: <TextSpan> [
            new TextSpan(text: 'Ma', style: TextStyle(color: Colors.red, fontSize: 24) ),
            new TextSpan(text: 'R', style: TextStyle(color: Colors.amber, fontSize: 24) ),
            new TextSpan(text: 'SiP', style: TextStyle(color: Colors.green, fontSize: 24) ),
            new TextSpan(text: 'AN', style: TextStyle(color: Colors.blue, fontSize: 24) ),
          ]
        ))
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: Image.asset(
                    'assets/images/marsipan_2019_alpha.png'
                )
              ),
              RaisedButton(
                child: Text(
                    'Risk Assessment Tool',
                ),
                color: marsipanDarkGrey,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RiskAssessmentRoute())
                  );
                },
              ),
              RaisedButton(
                child: Text('Percentage Median BMI Calculator'),
                color: marsipanDarkGrey,
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PercentageMedianBMICalculatorRoute())
                  );
                },
              ),
            ],
          ),

      ),
    );
  }
}
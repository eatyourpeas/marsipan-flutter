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
            primarySwatch: rcpchLightBlue,
            splashColor: rcpchDarkBlue,
            highlightColor: rcpchDarkBlue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            backgroundColor: RCPCHLightGrey.shade600,
            fontFamily: 'Montserrat'),
        routes: {
          RiskAssessmentRoute.routeName: (context) =>
              const RiskAssessmentRoute(),
        },
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Management of Emergencies in Eating Disorders')),
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
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 72,
                          fontFamily: 'Montserrat')),
                  new TextSpan(
                      text: 'E',
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 72,
                          fontFamily: 'Montserrat')),
                  new TextSpan(
                      text: 'E',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 72,
                          fontFamily: 'Montserrat')),
                  new TextSpan(
                      text: 'D',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 72,
                          fontFamily: 'Montserrat')),
                ])),
                Text(
                  'Managing Emergencies in Eating Disorders',
                  style: TextStyle(fontFamily: 'Montserrat'),
                )
              ],
            ),
            ElevatedButton(
              child: Text(
                'Percentage Median BMI Calculator',
                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: rcpchLightBlue),
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
                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: rcpchLightBlue),
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
                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: rcpchLightBlue),
              onPressed: () {
                Navigator.pushNamed(context, RiskAssessmentRoute.routeName,
                    arguments: RiskAssessmentToolArguments(true));
              },
            ),
            ElevatedButton(
              child: Text(
                'Risk Assessment Tool for under 18ys',
                style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: rcpchLightBlue),
              onPressed: () {
                Navigator.pushNamed(context, RiskAssessmentRoute.routeName,
                    arguments: RiskAssessmentToolArguments(false));
              },
            ),
          ],
        ),
      ),
    );
  }
}

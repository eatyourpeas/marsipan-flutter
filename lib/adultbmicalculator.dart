import 'package:flutter/material.dart';
import 'package:meed/colours.dart';
import 'package:meed/riskdetail.dart';
import 'adultbmiresults.dart';
import 'growthmethods.dart';
import 'data.dart';

class AdultBMICalculatorRoute extends StatefulWidget {
  final data = AdultBMIData(
    validated: false,
    weight: 0.0,
    height: 0.0,
    result: '',
    bmi: 0.0,
    isImperial: true,
    isWeight: false,
    weightString: "stone.pounds",
    heightString: "feet.inches",
    weightUnits: "stone",
    heightUnits: "feet",
    eighteenPointFive: 0.0,
  );

  AdultBMICalculatorRoute({data});
  @override
  _AdultBMICalculatorRouteState createState() =>
      _AdultBMICalculatorRouteState();
}

class _AdultBMICalculatorRouteState extends State<AdultBMICalculatorRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Adult BMI Calculator',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: rcpchStrongBlue,
          leading: BackButton(color: Colors.white),
        ),
        body: body(context));
  }

  Widget portrait() {
    return Column(children: <Widget>[
      HeightWidget(data: widget.data),
      WeightWidget(data: widget.data),
      ImperialDecimalWidget(data: widget.data, changeImperial: _changeImperial),
      CalculateWidget(data: widget.data)
    ]);
  }

  Widget body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return landscape();
    } else {
      return portrait();
    }
  }

  Widget landscape() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: HeightWidget(data: widget.data),
            ),
            Flexible(
              child: WeightWidget(data: widget.data),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(child: CalculateWidget(data: widget.data))
          ],
        )
      ],
    );
  }

  void _changeImperial(val) {
    final metricWeightHintText = "kg";
    final metricHeightHintText = "cm";
    final imperialWeightHintText = "stone'pounds";
    final imperialHeightHintText = "feet'inches";
    final metricHeightUnits = "cm";
    final metricWeightUnits = "kg";
    final imperialHeightUnits = "feet";
    final imperialWeightUnits = "stone";

    setState(() {
      val == 1
          ? widget.data.heightString = imperialHeightHintText
          : widget.data.heightString = metricHeightHintText;
      val == 1
          ? widget.data.weightString = imperialWeightHintText
          : widget.data.weightString = metricWeightHintText;
      val == 1
          ? widget.data.heightUnits = imperialHeightUnits
          : widget.data.heightUnits = metricHeightUnits;
      val == 1
          ? widget.data.weightUnits = imperialWeightUnits
          : widget.data.weightUnits = metricWeightUnits;
    });
  }
}

class HeightWidget extends StatefulWidget {
  final AdultBMIData data;
  HeightWidget({required this.data});
  @override
  _HeightWidgetState createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  final heightTextController = TextEditingController();
  bool _validate = false;
  FocusNode _focus = new FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      setState(() {
        widget.data.heightString = "";
        widget.data.height = 0.0;
      });
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    heightTextController.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: Container(
                child: new Icon(Icons.show_chart),
              ),
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 10.0, 0.0),
            )
          ],
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
                child: TextFormField(
                  focusNode: _focus,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter height in cm';
                    }
                    return null;
                  },
                  controller: heightTextController,
                  onChanged: (text) => {
                    heightTextController.text.isEmpty
                        ? _validate = true
                        : _validate = false,
                    _didEnterHeight(text, widget.data.isImperial)
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      labelText: widget.data.heightString,
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      suffixText: widget.data.heightUnits),
                )))
      ],
    ));
  }

  _didEnterHeight(String heightString, bool isImperial) {
    if (heightString.isEmpty) {
      return;
    }
    double converted = 0.0;
    if (isImperial) {
      // test if decimal present
      double feet = 0.0;
      double inches = 0.0;
      const double feetToMetresConversion = 0.3048;
      const double inchesToMetresConversion = 0.00254;
      if (heightString.contains(".")) {
        var values = heightString.split(".");
        feet = double.parse(values[0]);
        if (values[1] != "") {
          inches = double.parse(values[1]);
        }
      } else {
        feet = double.parse(heightString);
      }
      converted =
          (feet * feetToMetresConversion) + (inchesToMetresConversion * inches);
    } else {
      converted = (double.parse(heightString) / 100);
    }
    setState(() {
      widget.data.height = converted;
    });
  }
}

class WeightWidget extends StatefulWidget {
  final AdultBMIData data;
  WeightWidget({required this.data});
  @override
  _WeightWidgetState createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  final weightTextController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    weightTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              child: Container(
                child: new Icon(
                  Icons.monitor_weight_outlined,
                ),
              ),
              padding: EdgeInsets.fromLTRB(30.0, 0.0, 10.0, 0.0),
            )
          ],
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
                child: TextFormField(
                  controller: weightTextController,
                  onChanged: (text) => {
                    // widget.data.weight =
                    // double.tryParse(weightTextController.text)
                    _validateWeight(text, widget.data.isImperial)
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                      labelText: widget.data.weightString,
                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      suffixText: widget.data.weightUnits),
                )))
      ],
    ));
  }

  _validateWeight(weightString, isImperial) {
    if (weightString == "") {
      return;
    }
    double convert = 0.0;
    if (isImperial) {
      double convertStoneToKg = 6.35029;
      double convertPoundsToKg = 0.453592;
      double stone = 0.0;
      double pounds = 0.0;
      if (weightString.contains(".")) {
        var values = weightString.split(".");
        stone = double.parse(values[0]);
        if (values[1] != "") {
          pounds = double.parse(values[1]);
        }
      } else {
        stone = double.parse(weightString) * convertStoneToKg;
      }
      convert = (stone * convertStoneToKg) + (pounds * convertPoundsToKg);
    } else {
      convert = double.parse(weightString);
    }
    setState(() {
      widget.data.weight = convert;
    });
  }
}

class ImperialDecimalWidget extends StatefulWidget {
  final AdultBMIData data;
  final IntCallback changeImperial;
  ImperialDecimalWidget({required this.data, required this.changeImperial});
  @override
  _ImperialDecimalWidgetState createState() => _ImperialDecimalWidgetState();
}

class _ImperialDecimalWidgetState extends State<ImperialDecimalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: new BoxConstraints(
          minHeight: 40.0,
          minWidth: 100.0,
          maxHeight: 50.0,
          maxWidth: 200.0,
        ),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 18.0, 10.0, 0.0),
                  child: Text(
                    "kg",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                  child: Switch(
                inactiveThumbColor: rcpchStrongBlue,
                inactiveTrackColor: rcpchLightBlue,
                activeColor: rcpchStrongBlue,
                activeTrackColor: rcpchLightBlue,
                onChanged: (val) => setState(() => {
                      widget.data.isImperial = val,
                      val ? widget.changeImperial(1) : widget.changeImperial(0)
                    }),
                value: widget.data.isImperial,
              )),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 18.0, 30.0, 0.0),
                  child: Text(
                    "lb",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ));
  }
}

class CalculateWidget extends StatefulWidget {
  final AdultBMIData data;
  CalculateWidget({required this.data});
  @override
  _CalculateWidgetState createState() => _CalculateWidgetState();
}

class _CalculateWidgetState extends State<CalculateWidget> {
  String summaryResult = '';
  String heightResult = '';
  String weightResult = '';
  String bmiResult = '';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: rcpchStrongBlue),
          onPressed: () => {
            setState(() => {
                  _didPressCalculateButton(widget.data),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AdultBMICalculatorResultsRoute(widget.data)))
                })
          },
          child: Text(
            "Calculate BMI",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ));
  }

  _didPressCalculateButton(AdultBMIData data) {
    double weight = data.weight;
    double height = data.height;
    var growthMethods = new GrowthMethods();
    widget.data.bmi =
        growthMethods.bmiFromHeightandWeight(height * 100, weight);
    widget.data.eighteenPointFive =
        growthMethods.weightForBMI(height * 100, 18.5);
  }
}

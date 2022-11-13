import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'growthmethods.dart';
import 'package:marsipan/calculatorresults.dart';
import 'data.dart';

class PercentageMedianBMICalculatorRoute extends StatelessWidget {
  final data = Data(
      selected: false,
      percentage: '',
      isFemale: true,
      weight: 0.0,
      height: 0.0,
      clinicDate: DateTime.now(),
      dobDate: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('%mBMI Calculator')), body: body(context));
  }

  @override
  Widget portrait() {
    return Column(children: <Widget>[
      BirthdayWidget(data: data),
      ClinicWidget(data: data),
      HeightWidget(data: data),
      WeightWidget(data: data),
      SexChoiceWidget(data: data),
      CalculateWidget(data: data)
    ]);
  }

  @override
  Widget body(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return landscape();
    } else {
      return portrait();
    }
  }

  @override
  Widget landscape() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: BirthdayWidget(data: data),
            ),
            Flexible(
              child: ClinicWidget(data: data),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: HeightWidget(data: data),
            ),
            Flexible(
              child: WeightWidget(data: data),
            )
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(child: SexChoiceWidget(data: data)),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[Flexible(child: CalculateWidget(data: data))],
        )
      ],
    );
  }
}

class HeightWidget extends StatefulWidget {
  final Data data;
  HeightWidget({this.data});
  @override
  _HeightWidgetState createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  final heightTextController = TextEditingController();
  bool _validate = false;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    heightTextController.dispose();
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: heightTextController,
                  onEditingComplete: () =>
                      {print('called ${heightTextController.text}')},
                  onChanged: (text) => {
                    heightTextController.text.isEmpty
                        ? _validate = true
                        : _validate = false,
                    _didEnterHeight(widget.data),
                    widget.data.height = double.tryParse(text)
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Height in cm',
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  ),
                )))
      ],
    ));
  }

  _didEnterHeight(Data data) {
//    print(data.height);
  }
}

class WeightWidget extends StatefulWidget {
  final Data data;
  WeightWidget({this.data});
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

  var percentage = '';
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
                  FontAwesomeIcons.scaleBalanced,
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
                    widget.data.weight =
                        double.tryParse(weightTextController.text)
                  },
                  onEditingComplete: () => {
                    widget.data.weight =
                        double.tryParse(weightTextController.text)
                  },
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: 'Weight in kg',
                    errorText: _validate ? 'Value Can\'t Be Empty' : null,
                  ),
                )))
      ],
    ));
  }
}

class BirthdayWidget extends StatefulWidget {
  final Data data;
  BirthdayWidget({this.data});
  @override
  _BirthdayWidgetState createState() => _BirthdayWidgetState();
}

class _BirthdayWidgetState extends State<BirthdayWidget> {
  var customFormat = DateFormat('E, d MMM yyyy');
  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(new Duration(days: (365 * 18))),
      lastDate: DateTime.now().add(new Duration(days: 365)),
    );
    if (picked != null && picked != widget.data.dobDate)
      setState(() {
        widget.data.dobDate = picked;
      });
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
                  Icons.cake,
                ),
              ),
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 0.0),
            )
          ],
        ),
        Expanded(
            child: Container(
          child: Container(
            child: Text(
              '${customFormat.format(widget.data.dobDate)}',
              textAlign: TextAlign.center,
            ),
          ),
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        )),
        Column(
          children: <Widget>[
            Container(
              child: IconButton(
                color: Colors.green,
                onPressed: () => showPicker(context),
                icon: Icon(Icons.calendar_today),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 30.0, 0.0),
            )
          ],
        )
      ],
    ));
  }
}

class ClinicWidget extends StatefulWidget {
  final Data data;
  ClinicWidget({this.data});
  @override
  _ClinicWidgetState createState() => _ClinicWidgetState();
}

class _ClinicWidgetState extends State<ClinicWidget> {
  var customFormat = DateFormat('E, d MMM yyyy');
  DateTime chosenDate = DateTime.now();
  var locale = 'en';
  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(new Duration(days: (365 * 18))),
      lastDate: DateTime.now().add(new Duration(days: 365)),
    );
    if (picked != null && picked != widget.data.clinicDate)
      setState(() {
        widget.data.clinicDate = picked;
      });
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
                  Icons.today,
                ),
              ),
              padding: EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 0.0),
            )
          ],
        ),
        Expanded(
            child: Container(
          child: Container(
            child: Text(
              '${customFormat.format(widget.data.clinicDate)}',
              textAlign: TextAlign.center,
            ),
          ),
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        )),
        Column(
          children: <Widget>[
            Container(
              child: IconButton(
                color: Colors.green,
                onPressed: () => showPicker(context),
                icon: Icon(Icons.calendar_today),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 30.0, 0.0),
            )
          ],
        )
      ],
    ));
  }
}

class SexChoiceWidget extends StatefulWidget {
  final Data data;
  SexChoiceWidget({this.data});
  @override
  _SexChoiceWidgetState createState() => _SexChoiceWidgetState();
}

class _SexChoiceWidgetState extends State<SexChoiceWidget> {
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
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 0.0),
                  child: Icon(FontAwesomeIcons.mars),
                )
              ],
            ),
            Expanded(
              child: Container(
                  child: Switch(
                inactiveThumbColor: Colors.blue,
                inactiveTrackColor: Colors.lightBlue,
                activeColor: Colors.pink,
                onChanged: (val) => setState(() => widget.data.isFemale = val),
                value: widget.data.isFemale,
              )),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 30.0, 0.0),
                  child: Icon(FontAwesomeIcons.venus),
                )
              ],
            ),
          ],
        ));
  }
}

class CalculateWidget extends StatefulWidget {
  final Data data;
  CalculateWidget({this.data});
  @override
  _CalculateWidgetState createState() => _CalculateWidgetState();
}

class _CalculateWidgetState extends State<CalculateWidget> {
  String summaryResult = '';
  String heightResult = '';
  String weightResult = '';
  String pctBMIResult = '';
  String ageResult = '';
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.green),
          onPressed: () => {
            setState(() => {
                  _didPressCalculateButton(widget.data),
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CalculatorResultsRoute(widget.data)))
                })
          },
          child: Text(
            "Calculate %mBMI",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
  }

  _didPressCalculateButton(Data data) {
    double weight = data.weight;
    double height = data.height;
    var growthMethods = new GrowthMethods();
    widget.data.decimalAge =
        growthMethods.decimalAgeFromDates(data.dobDate, data.clinicDate);
    widget.data.bmi = growthMethods.bmiFromHeightandWeight(height, weight);
    widget.data.pctMBMI = growthMethods.percentageMedianBMI(
        widget.data.bmi, widget.data.decimalAge, !data.isFemale);
    widget.data.bmiSDS = growthMethods.sds(
        "BMI", widget.data.decimalAge, widget.data.bmi, !data.isFemale);
    widget.data.bmiCentile =
        growthMethods.convertZScoreToCentile(widget.data.bmiSDS);
    widget.data.heightSDS = growthMethods.sds(
        "height", widget.data.decimalAge, height, !data.isFemale);
    widget.data.heightCentile =
        growthMethods.convertZScoreToCentile(widget.data.heightSDS);
    widget.data.weightSDS = growthMethods.sds(
        "weight", widget.data.decimalAge, weight, !data.isFemale);
    widget.data.weightCentile =
        growthMethods.convertZScoreToCentile(widget.data.weightSDS);
    double medianbmi = growthMethods.medianBMI(
        widget.data.bmi, widget.data.isFemale, widget.data.decimalAge);
    widget.data.hundredPCTWeight =
        growthMethods.weightForBMI(widget.data.height, medianbmi);
    widget.data.ninetyFivePCTWeight =
        growthMethods.weightForBMI(widget.data.height, medianbmi * 0.95);
    widget.data.ninetyPCTWeight =
        growthMethods.weightForBMI(widget.data.height, medianbmi * 0.9);
    widget.data.eightyFivePCTWeight =
        growthMethods.weightForBMI(widget.data.height, medianbmi * 0.85);
  }
}

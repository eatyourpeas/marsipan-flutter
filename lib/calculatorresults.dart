import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'data.dart';

class CalculatorResultsRoute extends StatefulWidget {
  final Data resultData;
  CalculatorResultsRoute(this.resultData);
  @override
  State createState() => new CalculatorResultsRouteState();
}

class CalculatorResultsRouteState extends State<CalculatorResultsRoute> {
  final _controller = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Results'),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            PageView(
              controller: _controller,
              children: <Widget>[
                ResultsWidget(resultData: widget.resultData),
                TargetsWidget(resultData: widget.resultData)
              ],
            ),
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 35),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DotsIndicator(
                        controller: _controller,
                        itemCount: 2,
                        onPageSelected: (int page) {},
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class ResultsWidget extends StatelessWidget {
  final Data resultData;
  ResultsWidget({required this.resultData});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                child: Text(
                  '${resultData.pctMBMI!.toStringAsFixed(1)} %',
                  style: TextStyle(
                      color: resultData.pctMBMI! > 85
                          ? Colors.green
                          : (resultData.pctMBMI! < 75
                              ? Colors.red
                              : Colors.amber),
                      fontSize: 48.0),
                )),
          ],
        ),
        Container(
            child: Row(
                // Age
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
                    child: Text('AGE'),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 10),
                  child: Text(
                    '${resultData.decimalAge!.toStringAsFixed(1)} years',
                    textAlign: TextAlign.right,
                  ),
                ),
              )
            ])),
        Container(
            child: Row(
                //height
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text('HEIGHT'),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Text(
                    '${resultData.height!.toStringAsFixed(1)} cm',
                    textAlign: TextAlign.right,
                  ),
                ),
              )
            ])),
        Container(
            child: Row(
                // height SDS
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text(
                      'SDS',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w200,
                          fontSize: 10),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Text(
                    '${resultData.heightSDS!.toStringAsFixed(1)}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w200,
                        fontSize: 10),
                  ),
                ),
              )
            ])),
        Container(
            child: Row(
                // height centile
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
                    child: Text(
                      'CENTILE',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w200,
                          fontSize: 10),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 10),
                  child: Text(
                    '${resultData.heightCentile} %',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w200,
                        fontSize: 10),
                  ),
                ),
              )
            ])),
        Container(
            child: Row(
                // weight
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text('WEIGHT'),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Text(
                    '${resultData.weight!.toStringAsFixed(1)} kg',
                    textAlign: TextAlign.right,
                  ),
                ),
              )
            ])),
        Container(
            child: Row(
                // weight SDS
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text(
                      'SDS',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w200,
                          fontSize: 10),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Text(
                    '${resultData.weightSDS!.toStringAsFixed(1)}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w200,
                        fontSize: 10),
                  ),
                ),
              )
            ])),
        Container(
            child: Row(
                // weight_centile
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
                    child: Text(
                      'CENTILE',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w200,
                          fontSize: 10),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 10),
                  child: Text(
                    '${resultData.weightCentile} %',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w200,
                        fontSize: 10),
                  ),
                ),
              )
            ])),
        Container(
            child: Row(
                // BMI
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text('BMI'),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Text(
                    '${resultData.bmi!.toStringAsFixed(1)} kg/m\u00B2',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ])),
        Container(
            child: Row(
                // BMI_SDS
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text(
                      'SDS',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w200,
                          fontSize: 10),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Text(
                    '${resultData.bmiSDS!.toStringAsFixed(1)}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w200,
                        fontSize: 10),
                  ),
                ),
              )
            ])),
        Container(
            child: Row(
                // BMI_Centile
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Text(
                      'CENTILE',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w200,
                          fontSize: 10),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: Text(
                    '${resultData.bmiCentile} %',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w200,
                        fontSize: 10),
                  ),
                ),
              )
            ])),
      ],
    ));
  }
}

class TargetsWidget extends StatelessWidget {
  final Data resultData;
  TargetsWidget({required this.resultData});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
            margin: EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                        child: Text(
                          'TARGETS',
                        )),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(50, 20, 0, 10),
                          child: Text('85%'),
                        )),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 50, 10),
                        child: Text(
                          '${resultData.eightyFivePCTWeight!.toStringAsFixed(1)} kg',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(50, 20, 0, 10),
                          child: Text('90%'),
                        )),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 50, 10),
                        child: Text(
                          '${resultData.ninetyPCTWeight!.toStringAsFixed(1)} kg',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(50, 20, 0, 10),
                          child: Text('95%'),
                        )),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 50, 10),
                        child: Text(
                          '${resultData.ninetyFivePCTWeight!.toStringAsFixed(1)} kg',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(50, 20, 0, 10),
                          child: Text('100%'),
                        )),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 50, 10),
                        child: Text(
                          '${resultData.hundredPCTWeight!.toStringAsFixed(1)} kg',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )),
      ],
    ));
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    required this.controller,
    required this.itemCount,
    required this.onPageSelected,
    this.color: Colors.red,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

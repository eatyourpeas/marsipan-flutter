import 'package:flutter/material.dart';
import 'data.dart';

class AdultBMICalculatorResultsRoute extends StatefulWidget {
  final AdultBMIData resultData;
  AdultBMICalculatorResultsRoute(this.resultData);
  @override
  State createState() => new AdultBMICalculatorResultsRouteState();
}

class AdultBMICalculatorResultsRouteState
    extends State<AdultBMICalculatorResultsRoute> {
  final _controller = new PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Results',
            style: TextStyle(color: Colors.white),
          ),
          leading: BackButton(color: Colors.white),
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
  final AdultBMIData resultData;
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
                  '${resultData.bmi.toStringAsFixed(1)} kg/m\u00B2',
                  style: TextStyle(
                      color: resultData.bmi > 115
                          ? Colors.green
                          : (resultData.bmi < 13 ? Colors.red : Colors.amber),
                      fontSize: 48.0),
                )),
          ],
        ),
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
                    '${resultData.height.toStringAsFixed(2)} m',
                    textAlign: TextAlign.right,
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
                    '${resultData.weight.toStringAsFixed(1)} kg',
                    textAlign: TextAlign.right,
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
                    '${resultData.bmi.toStringAsFixed(1)} kg/m\u00B2',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ])),
      ],
    ));
  }
}

class TargetsWidget extends StatelessWidget {
  final AdultBMIData resultData;
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
                          child: Text('18.5 kg/m\u00B2'),
                        )),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 50, 10),
                        child: Text(
                          '${resultData.eighteenPointFive.toStringAsFixed(1)} kg',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

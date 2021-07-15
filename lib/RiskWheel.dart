import 'dart:math';
import 'package:marsipan/riskdetail.dart';
import 'package:marsipan/risks.dart';
import 'package:flutter/material.dart';

import 'board_view.dart';
import 'model.dart';

class RiskWheel extends StatefulWidget {
  final bool selected = false;
  final int marsipanCategoryIndex;
  final RiskCategory riskCategory;
  final IntCallback onUpdateRiskDetail;
  RiskWheel(
      {this.riskCategory, this.marsipanCategoryIndex, this.onUpdateRiskDetail});
  @override
  State<StatefulWidget> createState() {
    return _RiskWheelState();
  }
}

class _RiskWheelState extends State<RiskWheel>
    with SingleTickerProviderStateMixin {
  Size get size => Size(MediaQuery.of(context).size.width * 0.5,
      MediaQuery.of(context).size.width * 0.5);

  double _angle = 0.0;
  double _current = 0;
  String riskValue = '';
  double red = 0;
  double amber = 0.125;
  double green = 0.25;
  double blue = 0.375;

  Risk risk;
  bool pressedSelect = false;

  List<RiskColour> _items = [
    RiskColour(Colors.red, 'Red'),
    RiskColour(Colors.amber, 'Amber'),
    RiskColour(Colors.green, 'Green'),
    RiskColour(Colors.blue, 'Blue'),
  ];

  @override
  void initState() {
    super.initState();

    if (scoredCategories[widget.marsipanCategoryIndex].colour == "Red") {
      _angle = red;
      risk = widget.riskCategory.red;
      pressedSelect = true;
    }
    if (scoredCategories[widget.marsipanCategoryIndex].colour == "Amber") {
      risk = widget.riskCategory.amber;
      _angle = amber;
      pressedSelect = true;
    }
    if (scoredCategories[widget.marsipanCategoryIndex].colour == "Green") {
      risk = widget.riskCategory.green;
      _angle = green;
      pressedSelect = true;
    }
    if (scoredCategories[widget.marsipanCategoryIndex].colour == "Blue") {
      risk = widget.riskCategory.blue;
      _angle = blue;
      pressedSelect = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pressedSelect ? risk.selectedPaleColour : Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            child: Text(
              widget.riskCategory.category,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        body: Center(
            child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 100.0, 0, 16.0),
            child: Stack(alignment: Alignment.center, children: <Widget>[
              Container(
                child: GestureDetector(
                  onPanUpdate: (details) => updatePan(details),
                  child: BoardView(
                      items: _items, current: _current, angle: _angle),
                ),
              ),
              pressedSelect ? _boxShadow() : new Container(),
              _buildGo(widget),
            ]),
          ),
          _buildRiskText(_angle)
        ])));
  }

  _boxShadow() {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black38)]),
    );
  }

  updatePan(details) {
    if (!pressedSelect) {
      return setState(
        () {
          _panHandler(details);
        },
      );
    }
  }

  _buildGo(RiskWheel w) {
    return Material(
      color: pressedSelect ? Colors.grey : Colors.white,
      shape: CircleBorder(),
      child: InkWell(
          customBorder: CircleBorder(),
          child: Container(
            alignment: Alignment.center,
            height: 72,
            width: 72,
            child: Text(
              pressedSelect ? "UNSET" : "SET",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: pressedSelect ? Colors.red : Colors.black),
            ),
          ),
          onTap: () => setState(() => {
                pressedSelect = !pressedSelect,
                if (pressedSelect)
                  {
                    if (riskValue == 'Red')
                      {
                        risk = widget.riskCategory.red,
                      },
                    if (riskValue == 'Amber')
                      {
                        risk = widget.riskCategory.amber,
                      },
                    if (riskValue == 'Green')
                      {
                        risk = widget.riskCategory.green,
                      },
                    if (riskValue == 'Blue')
                      {
                        risk = widget.riskCategory.blue,
                      },
                    scoredCategories[widget.marsipanCategoryIndex] = risk,
                  }
                else
                  {
                    scoredCategories[widget.marsipanCategoryIndex] =
                        marsipanCategories[widget.marsipanCategoryIndex]
                            .unscored
                  },
                w.onUpdateRiskDetail(widget.marsipanCategoryIndex)
              })),
    );
  }

  _buildRiskText(angle) {
    if (angle >= 0.5 || angle <= -0.5) {
      _angle = 0.0;
    }
    riskValue = 'Red';
    if ((_angle > 0.0625 && _angle < 0.1875) ||
        (_angle < -0.3125 && _angle >= -0.4375)) {
      riskValue = 'Amber';
    }
    if ((_angle >= 0.1875 && _angle <= 0.3125) ||
        (_angle <= -0.1875 && _angle >= -0.3125)) {
      riskValue = 'Green';
    }
    if ((_angle > 0.3125 && _angle <= 0.4375) ||
        (_angle < -0.0625 && _angle > -0.1875)) {
      riskValue = 'Blue';
    }

    RiskCategory category = marsipanCategories[widget.marsipanCategoryIndex];
    var _riskText = '';
    if (riskValue == 'Red') {
      _riskText = category.red.description;
    }
    if (riskValue == 'Amber') {
      _riskText = category.amber.description;
    }
    if (riskValue == 'Green') {
      _riskText = category.green.description;
    }
    if (riskValue == 'Blue') {
      _riskText = category.blue.description;
    }
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Align(
          alignment: Alignment.topCenter,
          child: Text(
            _riskText,
            style: TextStyle(fontSize: 24),
          )),
    );
  }

  getColorText(double value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

//  _buildResult(angle) {
//
//    //var current = getColorText(angle);
//    return Padding(
//      padding: EdgeInsets.symmetric(vertical: 16.0),
//      child: Align(
//        alignment: Alignment.topCenter,
//        child: Text('$riskValue')
//      ),
//    );
//  }

  void _panHandler(DragUpdateDetails d) {
    /// Pan location on the wheel
    bool onTop = d.localPosition.dy <= size.width / 2;
    bool onLeftSide = d.localPosition.dx <= size.width / 2;
    bool onRightSide = !onLeftSide;
    bool onBottom = !onTop;

    /// Pan movements
    bool panUp = d.delta.dy <= 0.0;
    bool panLeft = d.delta.dx <= 0.0;
    bool panRight = !panLeft;
    bool panDown = !panUp;

    /// Absoulte change on axis
    double yChange = d.delta.dy.abs();
    double xChange = d.delta.dx.abs();

    /// Directional change on wheel
    double verticalRotation = (onRightSide && panDown) || (onLeftSide && panUp)
        ? yChange
        : yChange * -1;

    double horizontalRotation =
        (onTop && panRight) || (onBottom && panLeft) ? xChange : xChange * -1;

    // Total computed change
    double rotationalChange = verticalRotation + horizontalRotation;

    bool movingClockwise = rotationalChange > 0;
//    bool movingCounterClockwise = rotationalChange < 0;

    if (movingClockwise) {
      // int dir = d.delta.direction < pi / 2 ? 1 : -1;
      _angle += -(d.delta.distance * pi / 180);
    } else {
      // int dir = d.delta.direction < pi / 2 ? 1 : -1;
      _angle += d.delta.distance * pi / 180;
    }
  }
}

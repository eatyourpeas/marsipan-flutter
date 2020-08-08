import 'dart:math';
import 'package:marsipan/risks.dart';
import 'package:flutter/material.dart';

import 'board_view.dart';
import 'model.dart';

class RiskWheel extends StatefulWidget {

  bool selected = false;
  int marsipanCategoryIndex;
  RiskCategory riskCategory;
  RiskWheel(this.riskCategory, this.marsipanCategoryIndex);
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
  String _risk_value = '';
  // double _value = 0.0;
  double red = 0;
  double amber = 0.125;
  double green = 0.25;
  double blue = 0.375;


  Risk risk;
  bool pressedGo = false;

  List<Luck> _items = [
    Luck(Colors.red, 'Red'),
    Luck(Colors.amber, 'Amber'),
    Luck(Colors.green, 'Green'),
    Luck(Colors.blue, 'Blue'),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(scoredCategories[widget.marsipanCategoryIndex].colour == "Red"){
      _angle = red;
      risk = widget.riskCategory.red;
      pressedGo = true;
    }
    if(scoredCategories[widget.marsipanCategoryIndex].colour == "Amber"){
      risk = widget.riskCategory.amber;
      _angle = amber;
      pressedGo = true;
    }
    if(scoredCategories[widget.marsipanCategoryIndex].colour == "Green"){
      risk = widget.riskCategory.green;
      _angle = green;
      pressedGo = true;
    }
    if(scoredCategories[widget.marsipanCategoryIndex].colour == "Blue"){
      risk = widget.riskCategory.blue;
      _angle = blue;
      pressedGo = true;
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: pressedGo ? risk.selectedColour : Colors.white,
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
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 100.0, 0, 16.0),
                    child: Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                            Container(
                              child: GestureDetector(
                                onPanUpdate: (details) => updatePan(details),
                                child: BoardView(items: _items, current: _current, angle: _angle),
                              ),
                            ),
                            pressedGo ? _boxShadow() : new Container(),
                            _buildGo(),
                          ]
                      ),
                  ),
                  _buildRiskText(_angle)
                ]
            )
        )
    );
  }

  _boxShadow(){

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black38)]),
    );
  }

  updatePan (details) {
    if (!pressedGo) {
      return setState(
            () {
          _panHandler(details);
        },
      );
    }
  }

  _buildGo() {
    return Material(
      color: pressedGo ? Colors.grey : Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: Text(
            pressedGo ? "UNSET" : "SET",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: pressedGo ? Colors.red : Colors.black),
          ),
        ),
        onTap: () => setState( () => {
          pressedGo = !pressedGo,
              if (pressedGo) {
                  if (_risk_value == 'Red'){
                    risk = widget.riskCategory.red,
                  },
                  if (_risk_value == 'Amber'){
                    risk = widget.riskCategory.amber,

                  },
                  if (_risk_value == 'Green'){
                    risk = widget.riskCategory.green,
                  },
                  if (_risk_value == 'Blue'){
                    risk = widget.riskCategory.blue,
                  },
                  scoredCategories[widget.marsipanCategoryIndex] = risk
            } else {
              scoredCategories[widget.marsipanCategoryIndex] = marsipanCategories[widget.marsipanCategoryIndex].unscored
            }
        })
      ),
    );
  }

  _buildRiskText(angle) {

      if ( angle >= 0.5 || angle <= -0.5) {
        _angle = 0.0;
      };
      _risk_value = 'Red';
      if ((_angle > 0.0625 && _angle < 0.1875) || (_angle < -0.3125 && _angle >= -0.4375)) {
        _risk_value = 'Amber';
      }
      if((_angle >= 0.1875 && _angle <= 0.3125) || (_angle <= -0.1875 && _angle >= -0.3125)) {
        _risk_value = 'Green';
      }
      if ((_angle > 0.3125 && _angle <= 0.4375) || (_angle < -0.0625 && _angle > -0.1875)) {
        _risk_value = 'Blue';
      }

      RiskCategory category = marsipanCategories[widget.marsipanCategoryIndex];
      var _riskText = '';
      if (_risk_value == 'Red'){
        _riskText = category.red.description;
      }
      if (_risk_value == 'Amber'){
        _riskText = category.amber.description;
      }
      if (_risk_value == 'Green'){
        _riskText = category.green.description;
      }
      if (_risk_value == 'Blue'){
        _riskText = category.blue.description;
      }
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Align(
          alignment: Alignment.topCenter,
          child: Text(_riskText)
      ),
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
//        child: Text('$_risk_value')
//      ),
//    );
//  }

  void _panHandler(DragUpdateDetails d) {

    /// Pan location on the wheel
    bool onTop = d.localPosition.dy <= size.width/2;
    bool onLeftSide = d.localPosition.dx <= size.width/2;
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

    double horizontalRotation = (onTop && panRight) || (onBottom && panLeft)
        ? xChange
        : xChange * -1;

    // Total computed change
    double rotationalChange = verticalRotation + horizontalRotation;

    bool movingClockwise = rotationalChange > 0;
//    bool movingCounterClockwise = rotationalChange < 0;


    if (movingClockwise){
      // int dir = d.delta.direction < pi / 2 ? 1 : -1;
      _angle += -(d.delta.distance * pi / 180);
    } else {
      // int dir = d.delta.direction < pi / 2 ? 1 : -1;
      _angle += d.delta.distance * pi / 180;
    }
  }

}
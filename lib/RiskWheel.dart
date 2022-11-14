import 'dart:math';
import 'package:meed/colours.dart';
import 'package:meed/riskdetail.dart';
import 'package:meed/risks.dart';
import 'package:flutter/material.dart';

import 'board_view.dart';
import 'model.dart';

class RiskWheel extends StatefulWidget {
  final bool selected = false;
  final int marsipanCategoryIndex;
  final RiskCategory riskCategory;
  final IntCallback onUpdateRiskDetail;
  final bool isOver18y;

  RiskWheel(
      {required this.riskCategory,
      required this.marsipanCategoryIndex,
      required this.onUpdateRiskDetail,
      required this.isOver18y});

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
  double amber = 0.33;
  double green = 0.67;

  late Risk risk;
  bool pressedSelect = false;

  List<RiskColour> _items = [
    RiskColour(Colors.red, 'Red'),
    RiskColour(Colors.amber, 'Amber'),
    RiskColour(Colors.green, 'Green'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pressedSelect ? risk.selectedPaleColour : Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: widget.isOver18y ? rcpchStrongBlue : rcpchLightBlue,
          title: Text(
            widget.riskCategory.category,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          leading: BackButton(color: Colors.white),
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
    if ((_angle > 0.33) || (_angle < -0.11 && _angle > -0.33)) {
      riskValue = 'Green';
    }
    if ((_angle <= 0.33 && _angle >= 0.11) || _angle <= -0.33) {
      riskValue = 'Amber';
    }

    RiskCategory category = marsipanCategories[widget.marsipanCategoryIndex];
    var descriptions = [];
    var guidance = [];
    var references = [];

    if (riskValue == 'Red') {
      if (widget.isOver18y) {
        descriptions = category.red.over18descriptions;
        references = category.red.over18references;
        guidance = category.red.over18guidance;
      } else {
        descriptions = category.red.under18descriptions;
        references = category.red.under18guidance;
        guidance = category.red.under18references;
      }
    }
    if (riskValue == 'Amber') {
      if (widget.isOver18y) {
        descriptions = category.amber.over18descriptions;
        references = category.amber.over18guidance;
        guidance = category.amber.over18references;
      } else {
        descriptions = category.amber.under18descriptions;
        references = category.amber.under18guidance;
        guidance = category.amber.under18references;
      }
    }

    if (riskValue == 'Green') {
      if (widget.isOver18y) {
        descriptions = category.green.over18descriptions;
        references = category.green.over18guidance;
        guidance = category.green.over18references;
      } else {
        descriptions = category.green.under18descriptions;
        references = category.green.under18guidance;
        guidance = category.green.under18references;
      }
    }

    List<Widget> descriptionTexts() {
      List<Widget> list = [];
      list.add(Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
        child: Text(
          'Criteria',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
      ));
      for (int i = 0; i < descriptions.length; i++) {
        list.add(Text(descriptions[i], style: TextStyle(fontSize: 18)));
      }
      return list;
    }

    List<Widget> guidanceTexts() {
      List<Widget> list = [];
      list.add(Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
        child: Text(
          'Guidance',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
      ));
      for (int i = 0; i < guidance.length; i++) {
        list.add(Text(guidance[i],
            style: TextStyle(
              fontSize: 18,
            )));
      }
      return list;
    }

    List<Widget> referenceTexts() {
      List<Widget> list = [];
      list.add(Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
        child: Text(
          'References',
          style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
        ),
      ));
      for (int i = 0; i < references.length; i++) {
        list.add(Text(references[i], style: TextStyle(fontSize: 18)));
      }
      return list;
    }

    return Padding(
        padding: EdgeInsets.all(20.0),
        child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: rcpchDarkBlue))),
                  child: widget.isOver18y
                      ? Text(
                          'Guidance for Over 18y',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: rcpchDarkBlue),
                        )
                      : Text(
                          'Guidance for Under 18y',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18,
                              color: rcpchDarkBlue),
                        ),
                ),
                if (descriptions.length > 0) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: descriptionTexts(),
                  )
                ],
                if (guidance.length > 0) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: guidanceTexts(),
                  )
                ],
                if (references.length > 0) ...[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: referenceTexts(),
                  )
                ],
              ],
            )));
  }

  getColorText(double value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

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

import 'package:flutter/material.dart';
import 'package:marsipan/RiskWheel.dart';
import 'package:marsipan/risks.dart';

class RiskAssessmentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Risk Assessment Tool'),
        ),
        body: RiskBodyLayout());
  }
}

class RiskBodyLayout extends StatefulWidget {
  @override
  RiskBodyLayoutState createState() {
    return new RiskBodyLayoutState();
  }
}

class RiskBodyLayoutState extends State<RiskBodyLayout> {
  @override
  Widget build(BuildContext context) {
    return _risksListView(context);
  }

  List<Risk> selectedRisks =
      scoredCategories; // the list of selected categories

  _updateRiskCallback(riskIndex) {
    // this is a callback function from RiskWheel
    setState(() {
      selectedRisks = scoredCategories;
    });
  }

  Widget _risksListView(BuildContext context) {
    return ListView.builder(
        itemCount: selectedRisks.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: new BoxDecoration(
                color: scoredCategories[index].selectedColour),
            child: ListTile(
              leading: Icon(marsipanCategories[index].icon,
                  color: scoredCategories[index].selectedColour == Colors.white
                      ? Colors.black
                      : Colors.white),
              title: Text(
                marsipanCategories[index].category,
                style: TextStyle(
                    color:
                        scoredCategories[index].selectedColour == Colors.white
                            ? Colors.black
                            : Colors.white),
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: scoredCategories[index].selectedColour == Colors.white
                      ? Colors.black
                      : Colors.white),
              onTap: () async {
                await Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new RiskWheel(
                              riskCategory: marsipanCategories[index],
                              marsipanCategoryIndex: index,
                              onUpdateRiskDetail: _updateRiskCallback,
                            )));
                // setState(() {}
                // );
              },
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:marsipan/RiskWheel.dart';
import 'package:marsipan/colours.dart';
import 'package:marsipan/risks.dart';
import 'package:marsipan/riskdetail.dart';

class RiskAssessmentRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Risk Assessment Tool'),
      ),
      body: RiskBodyLayout(),
    );
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


  Widget _risksListView(BuildContext context) {
    Color color = Colors.white;
    return ListView.builder(
        itemCount: marsipanCategories.length,
        itemBuilder: (context, index) {
          if (scoredCategories[index].category ==
              marsipanCategories[index].category) {
            if (scoredCategories[index].colour == 'Red') {
              color = Colors.red;
            }
            if (scoredCategories[index].colour == 'Amber') {
              color = Colors.amber;
            }
            if (scoredCategories[index].colour == 'Green') {
              color = Colors.green;
            }
            if (scoredCategories[index].colour == 'Blue') {
              color = Colors.blue;
            }
            if (scoredCategories[index].colour == 'White') {
              color = Colors.white;
            }
          }
          return Container(
            decoration: new BoxDecoration(
                color: color
            ),
            child: ListTile(
              leading: Icon(marsipanCategories[index].icon),
              title: Text(marsipanCategories[index].category),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () async {
                await Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new RiskWheel(marsipanCategories[index], index)
                    )
                );
                setState(() {

                });
              },
            ),
          );
        }

    );
  }
}
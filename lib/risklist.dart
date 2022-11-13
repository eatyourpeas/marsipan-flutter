import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marsipan/RiskWheel.dart';
import 'package:marsipan/risks.dart';

class RiskAssessmentToolArguments {
  final bool isOver18y;
  RiskAssessmentToolArguments(this.isOver18y);
}

class RiskAssessmentRoute extends StatelessWidget {
  const RiskAssessmentRoute({super.key});

  static const routeName = '/riskAssessmentTool';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as RiskAssessmentToolArguments;
    var suffix = '- Under 18y';
    if (args.isOver18y) {
      suffix = '- Over 18y';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Risk Assessment Tool $suffix'),
        ),
        body: RiskBodyLayout(
          isOver18: args.isOver18y,
        ));
  }
}

class RiskBodyLayout extends StatefulWidget {
  final bool isOver18;

  const RiskBodyLayout({Key? key, required this.isOver18}) : super(key: key);

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
              leading: FaIcon(marsipanCategories[index].icon,
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
                              isOver18y: widget.isOver18,
                            )));
                // setState(() {}
                // );
              },
            ),
          );
        });
  }
}

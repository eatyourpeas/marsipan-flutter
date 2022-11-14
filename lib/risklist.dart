import 'package:flutter/material.dart';
import 'package:meed/RiskWheel.dart';
import 'package:meed/colours.dart';
import 'package:meed/risks.dart';

class RiskAssessmentToolArguments {
  final bool isOver18y;
  RiskAssessmentToolArguments(this.isOver18y);
}

class RiskAssessmentRoute extends StatefulWidget {
  const RiskAssessmentRoute({super.key});
  static const routeName = '/riskAssessmentTool';

  @override
  State<RiskAssessmentRoute> createState() => _RiskAssessmentRoute();
}

class _RiskAssessmentRoute extends State<RiskAssessmentRoute> {
  List<Risk> selectedRisks =
      scoredCategories; // the list of selected categories

  void _updateRiskCallback(riskIndex) {
    // this is a callback function from RiskWheel
    setState(() {
      selectedRisks = scoredCategories;
    });
  }

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
          title: Text('Risk Assessment Tool $suffix',
              style: TextStyle(color: Colors.white)),
          backgroundColor: args.isOver18y ? rcpchStrongBlue : rcpchLightBlue,
          leading: BackButton(color: Colors.white),
        ),
        body: RiskList(
            isOver18: args.isOver18y,
            selectedRisks: selectedRisks,
            onRiskSelectionChanged: (riskIndex) {
              _updateRiskCallback(riskIndex);
            }),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.replay_sharp,
              color: Colors.white,
            ),
            backgroundColor: args.isOver18y ? rcpchStrongBlue : rcpchLightBlue,
            onPressed: (() => setState(() {
                  // reset all the risks to unscored
                  for (var i = 0; i < scoredCategories.length; i++) {
                    scoredCategories[i] = marsipanCategories[i].unscored;
                  }
                }))));
  }
}

typedef IntCallback(riskIndex);

class RiskList extends StatelessWidget {
  final selectedRisks;
  final isOver18;

  final IntCallback onRiskSelectionChanged;
  RiskList(
      {Key? key,
      required this.isOver18,
      required this.selectedRisks,
      required this.onRiskSelectionChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: selectedRisks.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: scoredCategories[index].selectedColour,
            leading: Icon(marsipanCategories[index].icon,
                color: scoredCategories[index].selectedColour == Colors.white
                    ? Colors.black
                    : Colors.white),
            title: Text(
              marsipanCategories[index].category,
              style: TextStyle(
                  color: scoredCategories[index].selectedColour == Colors.white
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
                            onUpdateRiskDetail: onRiskSelectionChanged,
                            isOver18y: isOver18,
                          )));
            },
          );
        });
  }
}

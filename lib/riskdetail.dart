import 'package:flutter/material.dart';
import 'package:meed/risks.dart';

typedef void IntCallback(int id);

// ignore: must_be_immutable
class RiskDetail extends StatefulWidget {
  final IntCallback onRiskDetailUpdate;
  bool selected = false;
  final int marsipanCategoryIndex;
  final RiskCategory riskCategory;

  RiskDetail({
    Key? key,
    required this.riskCategory,
    required this.marsipanCategoryIndex,
    required this.selected,
    required this.onRiskDetailUpdate,
  });
  @override
  _RiskDetailWidgetState createState() => _RiskDetailWidgetState();
}

class _RiskDetailWidgetState extends State<RiskDetail> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  ///Page Controller for the PageView
  final controller = PageController(
    initialPage: 0,
  );
  var scrollDirection = Axis.horizontal;
  var actionIcon = Icons.swap_vert;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.riskCategory.category,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        leading: BackButton(color: Colors.white),
      ),

      ///A Page View with 3 children
      body: PageView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          Risk item = widget.riskCategory.red;
          if (index == 0) {
            item = widget.riskCategory.red;
          }
          if (index == 1) {
            item = widget.riskCategory.amber;
          }
          if (index == 2) {
            item = widget.riskCategory.green;
          }
          if (scoredCategories[widget.marsipanCategoryIndex].colour ==
              item.colour) {
            widget.selected = true;
          } else {
            widget.selected = false;
          }
          return Container(
            color: Colors.white,
            child: Card(
                shape: widget.selected
                    ? new RoundedRectangleBorder(
                        side: new BorderSide(color: Colors.black, width: 10.0),
                        borderRadius: BorderRadius.circular(4.0))
                    : new RoundedRectangleBorder(
                        side: new BorderSide(color: Colors.white, width: 10.0),
                        borderRadius: BorderRadius.circular(4.0)),
                color: item.selectedColour,
                elevation: 4,
                margin: EdgeInsets.all(24.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.selected = !widget.selected;
                      if (widget.selected) {
                        widget.onRiskDetailUpdate(1);
                        scoredCategories[widget.marsipanCategoryIndex] = item;
                      } else {
                        scoredCategories[widget.marsipanCategoryIndex] =
                            marsipanCategories[widget.marsipanCategoryIndex]
                                .unscored;
                      }
                    });
                  },
                )),
          );
        },
        controller: controller,
        scrollDirection: scrollDirection,

        ///Enable physics property to provide your PageView with a
        ///custom scroll behaviour
        ///Here BouncingScrollPhysics will pull back the boundary
        ///item (first or last) if the user tries to scroll further.
        // physics: BouncingScrollPhysics(),
        pageSnapping: true,
      ),
    );
  }
}

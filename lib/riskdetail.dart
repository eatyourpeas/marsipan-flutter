import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:marsipan/colours.dart';
import 'package:marsipan/risks.dart';

class RiskDetail extends StatefulWidget {
  bool selected = false;
  int marsipanCategoryIndex;
  RiskCategory riskCategory;
  RiskDetail(this.riskCategory, this.marsipanCategoryIndex);
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
        title: Container(
          child: Text(
            widget.riskCategory.category,
            style: TextStyle(
                fontSize: 20.0,
            ),
          ),
        ),
      ),
      ///A Page View with 3 children
      body: PageView.builder(
        itemCount: 4,
        itemBuilder: (context, index){
          Risk item = widget.riskCategory.red;
          Color color = Colors.red;
          if( index == 0) {
            item = widget.riskCategory.red;
            color = Colors.red;
          }
          if( index == 1) {
            item = widget.riskCategory.amber;
            color = Colors.amber;
          }
          if( index == 2) {
            item = widget.riskCategory.green;
            color = Colors.green;
          }
          if( index == 3) {
            item = widget.riskCategory.blue;
            color = Colors.blue;
          }
          if(scoredCategories[widget.marsipanCategoryIndex].colour == item.colour){
            widget.selected = true;
          } else {
            widget.selected = false;
          }
          return Container (
            color: Colors.white,
            child: Card(
              shape: widget.selected
                  ? new RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.black, width: 10.0),
                  borderRadius: BorderRadius.circular(4.0))
                  : new RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.white, width: 10.0),
                  borderRadius: BorderRadius.circular(4.0)),
              color: color,
              elevation: 4,
              margin: EdgeInsets.all(24.0),
              child: InkWell(
                onTap: (){
                  setState(() {
                    widget.selected = !widget.selected;
                    if(widget.selected){
                      scoredCategories[widget.marsipanCategoryIndex] = item;
                    } else {
                      scoredCategories[widget.marsipanCategoryIndex] = marsipanCategories[widget.marsipanCategoryIndex].unscored;
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.all(20.0),
                  child: Text(
                    item.description,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300,
                        fontSize: 18
                    ),
                  ),
                ),
              )

            ),
          );
        },
        controller: controller,
        scrollDirection: scrollDirection,
        ///Enable physics property to provide your PageView with a
        ///custom scroll behaviour
        ///Here BouncingScrollPhysics will pull back the boundary
        ///item (first or last) if the user tries to scroll further.
        //physics: BouncingScrollPhysics(),
        pageSnapping: true,
      ),
    );
  }
}

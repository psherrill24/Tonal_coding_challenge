import 'package:Tonal/models/dataModel.dart';
import 'package:Tonal/styles/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

//here is our actual widget builder that can be used in multiple different scenarios
//we simply pass it a height, width, and Metric model to build the widget
class MetricsWidget extends StatelessWidget {
  final Metrics mydata;
  final double height;
  final double width;

  const MetricsWidget(
      {Key key,
      @required this.mydata,
      @required this.height,
      @required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Used a Stack to put our data on top of the backgorund graph and box decoration we create
    return Stack(alignment: Alignment.center, children: [
      Align(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: height,
          width: width,
          //use the decoration style provided
          decoration: bubbleBoxDecoration,
          //use SVG method from pub.dev
          child: SvgPicture.asset(
            mydata.assetName,
            color: Colors.white,
            allowDrawingOutsideViewBox: false,
            alignment: Alignment.bottomCenter,
          ),
        ),
      ),
      //align and add column of text widgets to be placed on top of our container
      //used all the given text styles provided
      Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              mydata.label,
              style: labelTextStyle,
            ),
            Text(
              mydata.weight.toString(),
              style: weightTextStyle,
            ),
            Text(mydata.unit, style: unitTextStyle),
          ],
        ),
      )
    ]);
  }
}

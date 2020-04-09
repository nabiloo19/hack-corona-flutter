import 'package:flutter/material.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/display.dart';

class CustomExpandedText extends StatefulWidget {
  final String text;
  
  CustomExpandedText({Key key, this.text}):super(key:key);
  
  @override
  _CustomExpandedTextState createState() => _CustomExpandedTextState();
}

class _CustomExpandedTextState extends State<CustomExpandedText> {
  bool isExpanded = false;
  
  void _expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left:  DisplayUtil.screenAwareSize(16.0, context),
          right: DisplayUtil.screenAwareSize(16.0, context)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedCrossFade(
            firstChild: Text(
              widget.text,
              maxLines: 3,
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
            secondChild: Text(
              widget.text,
              style: TextStyle(fontSize: 13),
              textAlign: TextAlign.center,
            ),
            
            crossFadeState: isExpanded?CrossFadeState.showSecond:CrossFadeState.showFirst,
            duration: Duration(milliseconds: 200),
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
              onTap: _expand,
              child: Text(isExpanded ? "Less": "More...", style: TextStyle(fontSize: 15, color: AppColors.grey),))
        ],
      ),
    );
  }
}

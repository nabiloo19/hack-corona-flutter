import 'package:flutter/material.dart';
import 'package:hackcorona/utils/colors.dart';

class StatusCard extends StatelessWidget {
  final String label;
  final String value;
  final Color backgroundColor;
  final Color contentColor;

  StatusCard({
    Key key,
    this.label,
    this.value,
    this.backgroundColor = AppColors.primary,
    this.contentColor = AppColors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius:BorderRadius.circular(20.0),
      ),
      child: Container(
        width: 200.0,
        height: 150.0,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(value, style: TextStyle(color: contentColor, fontWeight: FontWeight.w700, fontSize: 28,),textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                Text(label, style: TextStyle(color: contentColor, ),textAlign: TextAlign.center,)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

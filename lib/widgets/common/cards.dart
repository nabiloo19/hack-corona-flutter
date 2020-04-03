import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/helpers.dart';

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
        borderRadius: BorderRadius.circular(20.0),
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
                Text(
                  value,
                  style: TextStyle(
                    color: contentColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  label,
                  style: TextStyle(
                    color: contentColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String title;
  final String caption;
  final String image;
  final Function onCardClick;
  final double width;

  PreventionCard({
    Key key,
    this.title,
    this.caption,
    this.image,
    @required this.onCardClick,
    this.width = 250.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 200,
                    child: Helpers.getImage(image, fit: BoxFit.cover)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Text(
                    caption,
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SymptomCard extends StatelessWidget {
  final String title;
  final String caption;
  final String image;
  final Function onCardClick;

  SymptomCard({
    Key key,
    this.title,
    this.caption,
    this.image,
    @required this.onCardClick,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 200,
                    child: Helpers.getImage(image, fit: BoxFit.cover)),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

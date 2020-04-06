import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcorona/models/corona_info.dart';
import 'package:hackcorona/utils/CustomShapeClipper.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/helpers.dart';
import 'package:hackcorona/utils/icons.dart';
import 'dart:math' as math;

class CoronaInfoDetail extends StatefulWidget {
  static final String TAG = "CoronaInfoDetail";

  final String infoType;
  final CoronaInfo info;

  CoronaInfoDetail({Key key, @required this.info, @required this.infoType})
      : super(key: key);

  @override
  _CoronaInfoDetailState createState() => _CoronaInfoDetailState();
}

class _CoronaInfoDetailState extends State<CoronaInfoDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            AppIcons.back,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildTopSection(),
          _buildContent(),
        ],
      ),
    );
  }

  _buildTopSection() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 50),
          height: 320.0,
          color: AppColors.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                widget.infoType.toUpperCase(),
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              Text(
                widget.info.title,
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),

        ///Image
        Positioned(
          right: 20,
          bottom: 20,
          child: Hero(
            tag: widget.info.title,
            child: Helpers.getImage(
              widget.info.image,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }

  _buildContent() {
    return Container(
      width: double.infinity,
      height: 400.0,
      transform: Matrix4.translationValues(0.0, -20.0, 0.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.info.caption,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.info.description,
                  style: TextStyle(fontSize: 15.0, color: Colors.black87),
                )
              ],
            ),
          )
        ],
      ),
    );
  } //_buildContent()

}

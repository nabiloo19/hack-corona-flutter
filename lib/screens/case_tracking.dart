import 'package:flutter/material.dart';

class CaseTracking extends StatefulWidget {
  @override
  _CaseTrackingState createState() => _CaseTrackingState();
}

class _CaseTrackingState extends State<CaseTracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Case Tracking"),
        centerTitle: true,
      ),
    );
  }
}

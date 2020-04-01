import 'package:flutter/material.dart';
import 'package:hackcorona/models/status.dart';
import 'package:hackcorona/services/database_service.dart';
import 'package:hackcorona/services/firestore_service.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/widgets/common/cards.dart';
import 'package:hackcorona/widgets/common/expanded_text.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseService _service;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service = DatabaseService(); //TODO: Provide this service with Provider
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildStatus(),
          SizedBox(
            height: 20,
          ),
          _buildIntroduction(),
          SizedBox(
            height: 20,
          ),
          _buildSymptoms(),
          SizedBox(
            height: 20,
          ),
          _buildPreventation()
        ],
      ),
    );
  }

  _buildStatus() {
    return StreamBuilder(
      stream: _service.globalSummaryStatusStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
            color: AppColors.background,
            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
            height: 140.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Status stat = snapshot.data[index];
                  return StatusCard(
                    label: stat.label,
                    value: stat.value,
                  );
                }),
          );
        } else {
          //TODO: Show Shimmer of Cards
          return SizedBox.shrink();
        }
      },
    );
  } // _buildStatus()

  _buildIntroduction() {
    return Card(
      elevation: 2.0,
      color: Colors.white,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('What is COVID-19?',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 20.0,
            ),
            CustomExpandedText(
              text:
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsu',
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }

  _buildSymptoms() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            "Symptoms",
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }

  _buildPreventation() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            "Preventation",
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}

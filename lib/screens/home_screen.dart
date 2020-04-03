import 'package:flutter/material.dart';
import 'package:hackcorona/models/corona_info.dart';
import 'package:hackcorona/models/status.dart';
import 'package:hackcorona/providers/AppLangProvider.dart';
import 'package:hackcorona/services/database_service.dart';
import 'package:hackcorona/services/firestore_service.dart';
import 'package:hackcorona/utils/AppLocalization.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/logger.dart';
import 'package:hackcorona/widgets/common/cards.dart';
import 'package:hackcorona/widgets/common/expanded_text.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static final String TAG = "HomeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DatabaseService _service;
  List<CoronaInfo> _symptoms = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service = DatabaseService(); //TODO: Provide this service with Provider

//    _loadSymptoms();
  }

  ///Load Symptoms
  _loadSymptoms() async {
    List<CoronaInfo> symptoms = await _service.getSymptoms();
    setState(() {
      _symptoms = symptoms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
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
            _buildPrevention()
          ],
        ),
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
            Text(AppLocalizations.of(context).translate("title"),
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 20.0,
            ),
            CustomExpandedText(
              text: AppLocalizations.of(context).translate('about_corona'),
            ),
          ],
        ),
      ),
    );
  }

  _buildSymptoms() {
    List<GridTile> tiles = [];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('Symptoms'),
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: _service.getSymptoms(),
            initialData: symptoms,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                Log.log(HomeScreen.TAG, message: "No Symptoms Data");
                return SizedBox.shrink();
              }

              
              if (snapshot.data.length == 0) {
                Log.log(HomeScreen.TAG, message: "Empty Data");
                return Center(
                  child: Text('No users have found! Please try again.'),
                );
              }
              
              Log.log(HomeScreen.TAG, message: "Get Data: ${snapshot.data.length}");
              var symptoms = snapshot.data;
              print(symptoms[0].title);

              //Add to Tile
              symptoms.forEach(
                (symptom) => tiles.add(
                  GridTile(
                    child: SymptomCard(
                      onCardClick: () => {},
                      caption: symptom.caption,
                      image: symptom.image,
                      title: symptom.title,
                    ),
                  ),
                ),
              );

              return GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: tiles,
              );
            },
          )
        ],
      ),
    );
  }

  _buildPrevention() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('Prevention'),
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 350.0,
            child: ListView.builder(
                itemCount: prevents.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  CoronaInfo prevent = prevents[index];

                  if (prevent == null) return SizedBox.shrink();
                  return PreventionCard(
                    onCardClick: () => {},
                    title: prevent.title,
                    image: prevent.image,
                    caption: prevent.caption,
                  );
                }),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hackcorona/constants/AnnounceType.dart';
import 'package:hackcorona/models/announcement.dart';
import 'package:hackcorona/providers/AppLangProvider.dart';
import 'package:hackcorona/services/database_service.dart';
import 'package:hackcorona/services/firestore_path.dart';
import 'package:hackcorona/utils/AppLocalization.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/logger.dart';
import 'package:hackcorona/widgets/common/expanded_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AnnouncementScreen extends StatefulWidget {
  static final String TAG = "Announcement";
  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  DatabaseService _service;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service = DatabaseService(); //TODO: Provide this service with Provider
   
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            AppLocalizations.of(context).translate("Announcements"),
            style: TextStyle(
              color: AppColors.primary,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: _buildTopAnnouncements(),
        )
      ],
    );
  }

  /// Top Announcements
  _buildTopAnnouncements() {
    var locale = Provider.of<AppLangProvider>(context, listen: false).appLocale.languageCode;
    return StreamBuilder(
      stream: _service.getCovidAnnouncements(
        FirestorePath.covidAnnouncements('en'),locale
      ),
      builder: (context, snap) {
        if (!snap.hasData) {
          return Center(
            child: Text('No Data Yet!'),
          );
        }
        
        if(snap.hasError) {
          return Center(
            child: Text('ERROR! Unable to fetch announcements'),
          );
        }
        
       
        return ListView.builder(
            itemCount: snap.data.length,
            itemBuilder: (BuildContext context, int index) {
              var announce = snap.data[index];
              return _buildListTile(announce);
            });
      },
    );
  }

  _buildListTile(Announcement announce) {
    Color borderColor = AppColors.primary;
    switch (announce.type) {
      case 0:
        borderColor = AppColors.orange;
        break;
      case 1:
        borderColor = AppColors.primary;
        break;
    }
    return Card(
      margin: const EdgeInsets.all(8),
      elevation: 2,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 4, color: borderColor))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Top Card
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  announce.date == null ? '' : DateFormat.yMMMMEEEEd().format(
                      new DateTime.fromMillisecondsSinceEpoch(
                          announce.date.millisecondsSinceEpoch)),
                  style: TextStyle(color: AppColors.grey, fontSize: 13),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomExpandedText(
                text: announce.message == null? '' : announce.message,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              announce.source,
              style: TextStyle(fontSize: 12, color: AppColors.primary),
            )
          ],
        ),
      ),
    );
  }
}

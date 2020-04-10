import 'package:flutter/material.dart';
import 'package:hackcorona/models/news.dart';
import 'package:hackcorona/providers/AppLangProvider.dart';
import 'package:hackcorona/services/database_service.dart';
import 'package:hackcorona/services/firestore_path.dart';
import 'package:hackcorona/utils/AppLocalization.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/helpers.dart';
import 'package:hackcorona/widgets/common/expanded_text.dart';
import 'package:line_icons/line_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> newsList;
  List<News> _newsList = [];
  DatabaseService _service;

  @override
  void initState() {
    super.initState();
    _service = new DatabaseService();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints.expand(height: 50),
            child: TabBar(
                labelColor: AppColors.primary,
                indicatorColor: AppColors.primary,
                tabs: [
                  Tab(text: AppLocalizations.of(context).translate("News")),
                  Tab(
                      text:
                          AppLocalizations.of(context).translate("FakeAlert")),
                ]),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                children: [
                  Container(
                    child: _buildNewsTab(),
                  ),
                  Container(
                    child: _buildFakeNewsTab(),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildNewsTab() {
    return StreamBuilder(
      stream: _service.getNews(
        FirestorePath.news(
            Provider.of<AppLangProvider>(context).appLocale.languageCode),
      ),
      builder: (context, snap) {
  
        if (!snap.hasData) {
          return Center(
            child: Text('No Data Yet!'),
          );
        }
  
        if(snap.hasError) {
          return Center(
            child: Text('ERROR! Unable to fetch data'),
          );
        }
        
        return CustomScrollView(
          slivers: <Widget>[
            SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return _buildNewsCard(snap.data[index]);
                  },
                  childCount: snap.data.length,
                ))
          ],
        );
      }
    );
  }

  _buildNewsCard(News news) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    news.title,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(LineIcons.calendar),
                          Text(
                            DateFormat.yMMMEd().format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    news.date.millisecondsSinceEpoch)),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(LineIcons.eye),
                          SizedBox(
                            width: 3,
                          ),
                          Text(news.views.toString()),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(LineIcons.thumbs_up),
                          Text(news.likes.toString()),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomExpandedText(
                    text: news.body,
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ),
            Helpers.getImage(news.image, fit: BoxFit.fitWidth),
          ],
        ),
      ),
    );
  }

  _buildFakeNewsTab() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[Text('Fake News')],
      ),
    );
  }
}

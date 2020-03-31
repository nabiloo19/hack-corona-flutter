import 'package:flutter/material.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:line_icons/line_icons.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<dynamic> newsList;

  @override
  void initState() {
    super.initState();
    newsList = List<dynamic>.generate(10, (index) {
      return _buildNewsTab();
    });
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
                  Tab(text: "News"),
                  Tab(text: "Fake News"),
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(
              height: 20,
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
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
                          'Lorem ipsum delor eust sard magna diama solor',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
                                Text('30-03-2020'),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(LineIcons.eye),
                                Text('234,304'),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(LineIcons.thumbs_up),
                                Text('321'),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.'),
                      ],
                    ),
                  ),
                  Image.network(
                    'https://picsum.photos/seed/picsum/200',
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),
            ),
          ]),
        )
      ],
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

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackcorona/screens/announcement_screen.dart';
import 'package:hackcorona/screens/case_tracking.dart';
import 'package:hackcorona/screens/home_screen.dart';
import 'package:hackcorona/screens/news_screen.dart';
import 'package:hackcorona/screens/questionAnswer_screen.dart';
import 'package:hackcorona/screens/volunteer_screen.dart';
import 'package:hackcorona/utils/AppLocalization.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/icons.dart';
import 'package:hackcorona/utils/logger.dart';
import 'package:hackcorona/widgets/common/custom_app_bar.dart';
import 'package:line_icons/line_icons.dart';

class DrawerMenu {
  final String name;
  final IconData icon;
  
  DrawerMenu({this.name, this.icon});
}

var  _drawerMenuList = [
  DrawerMenu(name: 'Home', icon: AppIcons.home),
  DrawerMenu(name: 'CaseTracking', icon: AppIcons.case_track),
  DrawerMenu(name: 'DangerZone', icon: AppIcons.danger_zone),
  DrawerMenu(name: 'SelfCheckup', icon: AppIcons.checkup),
  DrawerMenu(name: 'Volunteerism', icon: AppIcons.volunteer),
  DrawerMenu(name: 'QuestionAnswer', icon: AppIcons.question_answer),
  DrawerMenu(name: 'Donation', icon: AppIcons.donate),
  DrawerMenu(name: 'Help', icon: AppIcons.help),
  DrawerMenu(name: 'About', icon: AppIcons.about),
];


class LandingScreen extends StatefulWidget {
  static const String TAG = "LANDING_SCREEN";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentIndex;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  List<Widget> _screens = <Widget>[
    HomeScreen(),
    NewsScreen(),
    AnnouncementScreen(),
    VolunteerScreen(),
  ];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  
  _handleDrawerMenuClick(String key) {
    switch(key) {
      case "Home":
        Navigator.pop(context);
        break;
      case "CaseTracking":
        Navigator.push(context, MaterialPageRoute(builder: (_) => CaseTracking()));
        break;
      case "QuestionAnswer":
        Navigator.push(context, MaterialPageRoute(builder: (_) => QuestionAnswerScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          title: "Corona",
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
          child: Icon(Icons.menu),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Fluttertoast.showToast(msg: 'Messages');
          },
          child: Icon(
            LineIcons.envelope,
            color: AppColors.primary,
          ),
          backgroundColor: Colors.white,
          elevation: 4,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: _buildBottomNavBar(),
        body: _screens.elementAt(currentIndex),
        drawer: _buildDrawer());
  }

  _buildBottomNavBar() {
    return BubbleBottomBar(
      hasNotch: true,
      fabLocation: BubbleBottomBarFabLocation.end,
      opacity: 1,
      currentIndex: currentIndex,
      onTap: changePage,
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      elevation: 8,
      iconSize: 22,
      items: <BubbleBottomBarItem>[
        BubbleBottomBarItem(
          backgroundColor: AppColors.primary,
          icon: Icon(
            LineIcons.home,
            color: AppColors.primary,
          ),
          activeIcon: Icon(
            LineIcons.home,
            color: Colors.white,
          ),
          title: Text(
            "Home",
            style: TextStyle(color: AppColors.white, fontSize: 12),
          ),
        ),
        BubbleBottomBarItem(
          backgroundColor: AppColors.primary,
          icon: Icon(
            LineIcons.newspaper_o,
            color: AppColors.primary,
          ),
          activeIcon: Icon(
            LineIcons.newspaper_o,
            color: Colors.white,
          ),
          title: Text(
            "News",
            style: TextStyle(color: AppColors.white, fontSize: 12),
          ),
        ),
        BubbleBottomBarItem(
          backgroundColor: AppColors.primary,
          icon: Icon(
            LineIcons.bell,
            color: AppColors.primary,
          ),
          activeIcon: Icon(
            LineIcons.bell,
            color: Colors.white,
          ),
          title: Text(
            "Notification",
            style: TextStyle(color: AppColors.white, fontSize: 12),
          ),
        ),
      ],
    );
  }

  _buildDrawer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              AppIcons.close,
              color: AppColors.primary,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "COVID-19",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: _buildDrawerList(),
          )
        ],
      ),
    );
  } // _buildDrawer()

  _buildDrawerList() {
    return Container(
      height: double.infinity,
      padding: EdgeInsets.all(20),
      color: AppColors.white,
      child: ListView.builder(
        itemCount: _drawerMenuList.length,
        itemExtent: 60,
        itemBuilder: (BuildContext context, int index) {
          DrawerMenu menu = _drawerMenuList[index];
          return ListTile(
            onTap: () => _handleDrawerMenuClick(menu.name),
            leading: Icon(menu.icon),
            title: Text(AppLocalizations.of(context).translate(menu.name)),
          );
        },
      ),
    );
  }
}

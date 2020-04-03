import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackcorona/screens/announcement_screen.dart';
import 'package:hackcorona/screens/home_screen.dart';
import 'package:hackcorona/screens/news_screen.dart';
import 'package:hackcorona/screens/volunteer_screen.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/logger.dart';
import 'package:hackcorona/widgets/common/custom_app_bar.dart';
import 'package:line_icons/line_icons.dart';

class LandingScreen extends StatefulWidget {
  static const String TAG = "LANDING_SCREEN";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int currentIndex;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
         title: "Corona",
         onPressed: () => {},
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
    );
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
            style: TextStyle(color: AppColors.white,fontSize: 12),
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
            style: TextStyle(color: AppColors.white,fontSize: 12),
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
}

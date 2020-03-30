import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/logger.dart';
import 'package:hackcorona/widgets/common/cards.dart';
import 'package:hackcorona/widgets/common/expanded_text.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  static final String TAG = "HOME";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Log.log(HomeScreen.TAG, message: "Home Page is Initialized");
    return Scaffold(
//        appBar: AppBar(
//          backgroundColor: AppColors.background,
//          elevation: 0.0,
//        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            LineIcons.envelope,
            color: AppColors.primary,
          ),
          backgroundColor: Colors.white,
          elevation: 4,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: _buildBottomNavBar(),
        body: _buildBody());
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
            style: TextStyle(color: AppColors.white),
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
            style: TextStyle(color: AppColors.white),
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
            "Annonce..",
            style: TextStyle(color: AppColors.white, fontSize: 10),
          ),
        ),
  
        BubbleBottomBarItem(
          backgroundColor: AppColors.primary,
          icon: Icon(
            LineIcons.hand_pointer_o,
            color: AppColors.primary,
          ),
          activeIcon: Icon(
            LineIcons.hand_pointer_o,
            color: Colors.white,
          ),
          title: Text(
            "Volunteer",
            style: TextStyle(color: AppColors.white, fontSize: 10),
          ),
        ),

      ],
    );
  }

  _buildBody() {
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
  } //_buildBody()

  _buildStatus() {
    return Container(
      color: AppColors.background,
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 5.0),
      height: 140.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          StatusCard(
            label: 'Cases',
            value: '768,084',
          ),
          StatusCard(
            label: 'Cases',
            value: '768,084',
          ),
        ],
      ),
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

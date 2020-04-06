import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackcorona/models/corona_info.dart';
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
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: CustomScrollView(
            slivers: <Widget>[
              _buildSliverAppBar(),
              SliverPersistentHeader(
                pinned: false,
                delegate:_SliverAppBarDelegate(
                  minHeight: 20.0,
                  maxHeight: 200.0,
                  child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Center(child:
                      Text(widget.infoType, style: TextStyle(color: AppColors.white),))),
                ),
              ),
              
              SliverFixedExtentList(
                itemExtent: 150,
                delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: 600.0,
                        transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ]
                ),
              )
            ],
          ),
        ));
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
  
  _buildSliverAppBar() {
    return SliverAppBar(
      floating: true,
      pinned: false,
      leading: IconButton(
        icon: Icon(
          AppIcons.back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: AppColors.primary,
      expandedHeight: 350,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: <Widget>[
            Hero(
              tag: widget.info.id,
              child: Helpers.getImage(
                widget.info.image,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withOpacity(.4),
            )
          ],
        ),
        title: Text(
          widget.info.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
  
  _buildContent() {
    return SliverList(delegate: SliverChildBuilderDelegate((context, index) {
      return Container(
        height: 400.0,
        transform: Matrix4.translationValues(0.0, -20.0, 0.0),
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20.0)),
      );
    }));
  } //_buildContent()
  
  _buildTopSection() {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 50),
          height: 400.0,
          color: AppColors.primary,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      AppIcons.back,
                      color: Colors.white,
                    ),
                  ),
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
          bottom: 30,
          child: Hero(
            tag: widget.info.id,
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
  
  
}


///************* Sliver Deligate ***************/

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  
  final double minHeight;
  final double maxHeight;
  final Widget child;
  
  @override
  double get minExtent => minHeight;
  
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  
  @override
  Widget build(BuildContext context,
      double shrinkOffset,
      bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }
  
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

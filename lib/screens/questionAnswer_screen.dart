import 'package:flutter/material.dart';
import 'package:hackcorona/models/QuestionAnswer.dart';
import 'package:hackcorona/services/database_service.dart';
import 'package:hackcorona/services/firestore_path.dart';
import 'package:hackcorona/utils/AppLocalization.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:hackcorona/utils/icons.dart';

class QuestionAnswerScreen extends StatefulWidget {
  static final String TAG = "QuestionAnswerScreen";
  
  final String locale;
  
  QuestionAnswerScreen({Key key, this.locale = 'en'}):super(key: key);
  
  @override
  _QuestionAnswerScreenState createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  List<QuestionAnswer> _faqList = [];
  DatabaseService _service;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _service = DatabaseService(); //TODO: Provide this service with Provider
    _loadFAQ();
  }
  
  
  _loadFAQ() async{
    //Set List Empty
    setState(() {
      _faqList = [];
    });
    
    var faqList = await _service.getFAQ(FirestorePath.faq(widget.locale));
    if(faqList == null) return;
    setState(() {
      _faqList = faqList;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: <Widget>[
          _buildTopBar(),
          _buildButtons(),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: _buildBody(),
          )
        ],
      ),
    );
  }
  
  _buildTopBar() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200),
            bottomRight: Radius.circular(200),
          )),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            left: 30,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                AppIcons.back,
                color: AppColors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context).translate("QuestionAnswer"),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                transform: Matrix4.translationValues(0.0, 40.0, 0.0),
                child: Card(
                  elevation: 4,
                  child: Container(
                    color: AppColors.white,
                    width: 150,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('${_faqList.length}',  style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text(AppLocalizations.of(context).translate("Questions"),)
                      ],
                    )
                  ),
                ),
              )),
        ],
      ),
    );
  }
  
  _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(AppIcons.add),
              Text(AppLocalizations.of(context).translate("Ask")),
            ],
          ),
          GestureDetector(
            onTap: _loadFAQ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(AppIcons.refresh),
                Text(AppLocalizations.of(context).translate("Refresh")),
              ],
            ),
          )
        ],
      ),
    );
  }
  
  _buildBody() {
    return _faqList.length == 0 ? Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ) :  Container(
      height: double.infinity,
      child: ListView.builder(
        itemCount: _faqList.length,
        itemBuilder: (BuildContext context, int index) {
          return ExpansionPanelList(
            expansionCallback: (int item, bool isExpanded) {
              setState(() {
                _faqList[index].isExpanded = !_faqList[index].isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(_faqList[index].question,style:TextStyle(fontWeight: FontWeight.w600)),
                  );
                },
                body: ListTile(
                    title: Text(_faqList[index].answer,
                      style:TextStyle(fontSize: 14,color: AppColors.primary),
                    ),
                    subtitle:
                    Text(AppLocalizations.of(context).translate("FAQHitLike"), style:TextStyle(fontSize: 11),),
                    trailing: Column(
                      children: <Widget>[
                        Icon(AppIcons.like),
                        Text('${_faqList[index].likes}'),
                      ],
                    ),
                    onTap: () => {}),
                isExpanded: _faqList[index].isExpanded,
              )
            ],
          
          );
        },
      ),
    );
  }
}

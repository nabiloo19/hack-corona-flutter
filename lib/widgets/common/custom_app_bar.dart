import 'package:flutter/material.dart';
import 'package:hackcorona/providers/AppLangProvider.dart';
import 'package:hackcorona/utils/AppLocalization.dart';
import 'package:hackcorona/utils/logger.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  final Function onPressed;
  final Function onTitleTapped;

  @override
  final Size preferredSize;

  CustomAppBar(
      {@required this.title,
      @required this.child,
      @required this.onPressed,
      this.onTitleTapped})
      : preferredSize = Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    var lang = Provider.of<AppLangProvider>(context);

    return SafeArea(
      child: Column(
        children: <Widget>[
          // SizedBox(height: 30,),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Hero(
                tag: 'topBarBtn',
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: MaterialButton(
                    height: 50,
                    minWidth: 50,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                      ),
                    ),
                    onPressed: onPressed,
                    child: child,
                  ),
                ),
              ),
              // SizedBox(
              //   width: 50,
              // ),
              Hero(
                tag: 'title',
                transitionOnUserGestures: true,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                    ),
                  ),
                  child: InkWell(
                    onTap: () => _showDialog(context),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                AppLocalizations.of(context).translate(
                                    lang.currentLangName.toLowerCase()),
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  // color: Colors.black54,
                                ),
                              ),
                              Icon(
                                Icons.language,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (context) {
        return LangPickerDialog();
      },
    );
  }
}

class LangPickerDialog extends StatefulWidget {
  @override
  _LangPickerDialogState createState() => _LangPickerDialogState();
}

class _LangPickerDialogState extends State<LangPickerDialog> {
  String _currentLang;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _currentLang = Provider.of<AppLangProvider>(context, listen: false)
        .appLocale
        .languageCode;
  }

  void _languageChanged(String value) {
    setState(() {
      _currentLang = value;
      Provider.of<AppLangProvider>(context, listen: false)
          .changeLanguage(Locale(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context).translate('choose_lang')),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            ListTile(
              title: Text('English'),
              trailing: new Radio(
                onChanged: _languageChanged,
                value: 'en',
                groupValue: _currentLang,
              ),
            ),
            ListTile(
              title: Text('አማርኛ'),
              trailing: new Radio(
                onChanged: _languageChanged,
                value: 'am',
                groupValue: _currentLang,
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

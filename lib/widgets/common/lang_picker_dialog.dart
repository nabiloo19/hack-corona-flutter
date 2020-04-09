import 'package:flutter/material.dart';
import 'package:hackcorona/providers/AppLangProvider.dart';
import 'package:hackcorona/utils/AppLocalization.dart';
import 'package:hackcorona/utils/colors.dart';
import 'package:provider/provider.dart';

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
      titleTextStyle: TextStyle(fontSize: 18, color: AppColors.primary),
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
            ),
            ListTile(
              title: Text('OROMIFFA'),
              trailing: new Radio(
                onChanged: _languageChanged,
                value: 'am',
                groupValue: _currentLang,
              ),
            ),
            ListTile(
              title: Text('ትግርኛ'),
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

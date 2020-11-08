import 'package:flutter/material.dart';
import 'package:san_pya/constants/spacings.dart';
import 'package:san_pya/models/language.dart';
import 'package:san_pya/widgets/app_bar.dart';
import 'package:san_pya/widgets/block_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSettingScreen extends StatefulWidget {
  @override
  _LanguageSettingScreenState createState() => _LanguageSettingScreenState();
}

class _LanguageSettingScreenState extends State<LanguageSettingScreen> {
  int _selectedIndex;

  static const key = 'lang';

  static List<Language> _languages = [
    new Language(
        image: 'graphics/lang_english.png', name: 'English', shortCode: 'us'),
    new Language(
        image: 'graphics/lang_myanmar.png', name: 'Myanmar', shortCode: 'mm')
  ];

  @override
  void initState() {
    super.initState();
    _loadLanguageSetting();
  }

  _loadLanguageSetting() async {
    var prefs = await SharedPreferences.getInstance();
    var lang = prefs.getInt(key);
    setState(() {
      _selectedIndex = lang ?? 0;
    });
  }

  _languageSelectedHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _selectHandler() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    var textTheme = Theme.of(context).textTheme;
    var headline1 = textTheme.headline1;
    var subTitle1 = textTheme.subtitle1;

    return Scaffold(
        appBar: appBar(context, "Setting"),
        body: Container(
          margin: Edge.e4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: Edge.eb2,
                child: Text(
                  "Language",
                  style: headline1,
                ),
              ),
              Container(
                  margin: Edge.eb4,
                  child: Text(
                    "Select your language",
                    style: subTitle1,
                  )),
              Expanded(
                  child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  var selected = index == _selectedIndex;
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(_languages[index].image),
                    ),
                    title: Text(_languages[index].name,
                        style: TextStyle(
                            color: selected ? primaryColor : null,
                            fontSize: 14,
                            fontWeight: FontWeight.w500)),
                    selected: selected,
                    trailing: selected
                        ? Icon(Icons.check, color: primaryColor)
                        : null,
                    onTap: () => _languageSelectedHandler(index),
                  );
                },
              )),
              BlockButton(text: "Select", onPressed: _selectHandler),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_provider/theme_provider.dart';

class ThemeTextButton extends StatelessWidget {
  final String title;
  final String themeId;

  const ThemeTextButton({Key key, this.title, this.themeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => ThemeProvider.controllerOf(context).setTheme(themeId),
      child: Container(
        width: double.infinity,
        alignment: Alignment.centerLeft,
        height: 40,
        child: Text(
          title,
        ),
      ),
    );
  }
}

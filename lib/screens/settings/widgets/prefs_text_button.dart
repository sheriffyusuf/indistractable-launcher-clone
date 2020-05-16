import 'package:flutter/material.dart';

class PrefsTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const PrefsTextButton({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
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

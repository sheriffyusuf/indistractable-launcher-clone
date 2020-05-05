import 'package:flutter/widgets.dart';

class DialogText extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  DialogText({Key key, @required this.title, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        title,
        style: TextStyle(fontSize: 26),
      ),
    );
  }
}

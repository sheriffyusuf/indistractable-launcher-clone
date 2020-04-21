import 'package:flutter/material.dart';

class AppsScreen extends StatefulWidget {
  @override
  _AppsScreenState createState() => _AppsScreenState();
}

class _AppsScreenState extends State<AppsScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    List names = List.generate(20, (index) => "sheriff $index");
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            width: _width,
            height: _height * 0.10,
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search Apps",
                  hintStyle: TextStyle(color: Colors.white)),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (context, position) {
                  return ListTile(
                    title: Text(
                      names[position],
                      style: TextStyle(fontSize: 26),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}

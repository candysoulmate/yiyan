import 'dart:convert';

import 'package:candy_yiyan/ui/widget/vertical_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String textContext = '';
  String from = '';

  void getTextContext() async {
    var url = Uri.parse('https://v1.hitokoto.cn?c=d');
    var response = await http.get(url);
    Map<String, dynamic> respData = json.decode(response.body);
    setState(() {
      textContext = respData['hitokoto'];
      from = respData['from_who'];
    });
  }

  Widget imageWidget() {
    return const CircleAvatar(
        backgroundColor: Colors.white70,
        foregroundImage: NetworkImage('https://img.xjh.me/random_img.php?type=bg&ctype=nature&return=302'),
        radius: 90);
  }

  double singleLineWidth = 16;
  int numberOfSingleLineText = 10;
  Widget textWidget() {
    return VerticalText(
        from: from,
        textContext: textContext,
        singleLineWidth: singleLineWidth,
        numberOfSingleLineText: numberOfSingleLineText
    );
  }

  @override
  void initState() {
    super.initState();
    getTextContext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[imageWidget(), textWidget()],
        ),
      ),
    );
  }
  
}
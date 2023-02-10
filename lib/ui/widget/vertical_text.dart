import 'package:flutter/material.dart';

class VerticalText extends StatefulWidget {
  const VerticalText({
    Key? key,
    required this.from,
    required this.textContext,
    required this.singleLineWidth,
    required this.numberOfSingleLineText,
  }) : super(key: key);

  final String textContext;
  final String from;
  final int numberOfSingleLineText;
  final double singleLineWidth;

  @override
  State<VerticalText> createState() => _VerticalTextState();
}

class _VerticalTextState extends State<VerticalText> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int numberOfLines = widget.textContext.length ~/ widget.numberOfSingleLineText;

    if (widget.textContext.length % widget.numberOfSingleLineText > 0) {
      numberOfLines++;
    }
    List<Widget> allTextLine = [];
    String from = widget.from;

    for (int i = 0; i < numberOfLines; i++) {
      String singleLineText = '';
      singleLineText = widget.textContext.substring(
        widget.numberOfSingleLineText * i,
        i < numberOfLines - 1
            ? widget.numberOfSingleLineText * (i + 1)
            : widget.textContext.length
      );

      allTextLine.add(
        Container(
          margin: const EdgeInsets.only(right: 5),
          width: widget.singleLineWidth,
          child: Text(
            singleLineText,
            style: TextStyle(fontSize: widget.singleLineWidth + 1),
            textAlign: TextAlign.left,
          ),
        )
      );
    }

    for (int i = 0; i < allTextLine.length / 2; i++) {
      Widget temp = allTextLine[i];
      allTextLine[i] = allTextLine[allTextLine.length - 1 - i];
      allTextLine[allTextLine.length - 1 - i] = temp;
    }

    return AnimatedOpacity(
      opacity: widget.textContext != ''?  1.0 : 0.0,
      duration: const Duration(milliseconds: 2000),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: allTextLine,
            ),
          ),
          Text(
            '- $from -',
            style: TextStyle(fontSize: widget.numberOfSingleLineText + 1),
          )
        ],
      ),
    );
  }
}
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextDesign extends StatefulWidget {
  String? title;
  String? text;
  String? cal;

  TextDesign({super.key, this.text, this.title, this.cal});

  @override
  State<TextDesign> createState() => _TextDesignState();
}

class _TextDesignState extends State<TextDesign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              widget.title.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              widget.cal.toString(),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Text(
            widget.text.toString(),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

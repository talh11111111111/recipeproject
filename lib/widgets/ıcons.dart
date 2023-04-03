// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IconsScreen extends StatefulWidget {
  const IconsScreen({super.key});

  @override
  State<IconsScreen> createState() => _IconsScreenState();
}

class _IconsScreenState extends State<IconsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Icon(
            Icons.favorite_border_outlined,
            size: 26,
          ),
          SizedBox(
            width: 8,
          ),
          Icon(
            Icons.share_outlined,
            size: 26,
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}

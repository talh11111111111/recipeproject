import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  final String text;
  const Info({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.info_outline,
            size: 30,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

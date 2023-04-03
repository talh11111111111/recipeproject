import 'package:flutter/material.dart';

class SearchFoodTextField extends StatefulWidget {
  final TextEditingController controller;
  final IconButton postfunction;
  const SearchFoodTextField(
      {super.key, required this.controller, required this.postfunction});

  @override
  State<SearchFoodTextField> createState() => _SearchFoodTextFieldState();
}

class _SearchFoodTextFieldState extends State<SearchFoodTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 0.4,
          )),
      child: TextField(
          controller: widget.controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10, top: 14),
              border: InputBorder.none,
              hintText: 'Search all foods here',
              suffixIcon: widget.postfunction)),
    );
  }
}

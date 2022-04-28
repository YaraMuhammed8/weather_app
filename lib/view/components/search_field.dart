import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  TextEditingController controller;
  Function? onChanged;
  Widget? suffixIcon;
  SearchField(
      {Key? key, required this.controller, this.suffixIcon, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.grey.shade800),
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5),
        filled: true,
        fillColor: const Color(0xffF3F5F9),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Colors.blueGrey,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

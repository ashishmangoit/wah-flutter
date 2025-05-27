import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TextWidget(context) {
  return Material(
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.grey),
        hintText: 'Search headphone',
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    ),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget filterIconWithDropdown() {
  String selectedFilter = "Filter";

  return StatefulBuilder(
    builder: (context, setState) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedFilter,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(width: 8),
          PopupMenuButton<String>(
            icon:
                Icon(Icons.filter_alt_outlined, size: 16, color: Colors.black),
            onSelected: (value) {
              setState(() {
                selectedFilter = value;
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                  value: "Price: Low to High",
                  child: Text("Price: Low to High")),
              PopupMenuItem(
                  value: "Price: High to Low",
                  child: Text("Price: High to Low")),
              PopupMenuItem(value: "Newest", child: Text("Newest")),
              PopupMenuItem(value: "Popular", child: Text("Popular")),
            ],
          ),
        ],
      );
    },
  );
}

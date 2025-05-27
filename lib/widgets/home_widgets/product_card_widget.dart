import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget productCard({
  required String imageUrl,
  required String title,
  required String brand,
  required String rating,
  required String reviews,
  required bool trending,
  required BuildContext context,
  required bool isFavoriteInitial,
  required ValueChanged<bool> onFavoriteChanged,
}) {
  bool isFavorite = isFavoriteInitial;

  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(imageUrl,
                      height: 180, width: double.infinity, fit: BoxFit.cover),
                ),
                if (trending)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("Trending",
                          style: TextStyle(color: Colors.white, fontSize: 10)),
                    ),
                  ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      onFavoriteChanged(isFavorite);
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isFavorite ? Colors.white : Colors.grey),
                      child: Icon(
                        Icons.favorite,
                        color: isFavorite ? Colors.red : Colors.grey.shade200,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 2, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Text(brand, style: const TextStyle(color: Colors.grey)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text("$rating $reviews",
                          style: const TextStyle(fontSize: 12)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

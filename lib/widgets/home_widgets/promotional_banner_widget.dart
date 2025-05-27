import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/HexColor.dart';

Widget PromotionWidget(double padding, double width, double borderRadius,
    double margin, String background, String textImagePosition, context) {
  return Container(
    width: width,
    margin: EdgeInsets.all(margin ?? 2),
    padding: EdgeInsets.only(left: padding ?? 10, right: padding ?? 10),
    decoration: BoxDecoration(
      color: hexToColor(background) ?? Colors.white,
      borderRadius: BorderRadius.circular(borderRadius ?? 16),
    ),
    child: SizedBox(
      height: 200,
      child: Row(
          children: textImagePosition == 'rtl'
              ? [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            overflow: TextOverflow.visible,
                            softWrap: true,
                            "Buy 1 and Get 1 limited time sale",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Grab Now",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.arrow_forward_rounded,
                                    size: 16, color: Colors.orange),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Image.asset(
                      'assets/images/image (7).png',
                      height: 200,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  )
                ]
              : [
                  Image.asset(
                    'assets/images/image (7).png',
                    height: 200,
                    width: 150,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          "Buy 1 and Get 1 limited time sale",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Grab Now",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward_rounded,
                                  size: 16, color: Colors.orange),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
    ),
  );
}

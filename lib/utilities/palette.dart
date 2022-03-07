import 'package:flutter/material.dart';
import 'index.dart';

const Color kYellow = Color(0xFFFFE24B);
const Color kDarkGrey = Color(0xFF1D1D1D);
const Color kLightGrey = Color(0xFF646464);

class FontStyles {
  // Color fontSize;

  FontStyles()
      : movieTitle = const TextStyle(
          color: Colors.white,
          fontSize: 68,
          fontWeight: FontWeight.w500,
        ),
        gRated = const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        releaseY = const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        description = const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
        watchButton = const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        elseButton = const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);

  final TextStyle movieTitle;
  final TextStyle gRated;
  final TextStyle releaseY;
  final TextStyle description;
  final TextStyle watchButton;
  final TextStyle elseButton;
}

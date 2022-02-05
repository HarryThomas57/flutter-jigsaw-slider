import 'package:flutter/material.dart';

class PuzzleImage {
  final String id;
  final Image image;
  final String imageUrl;

  const PuzzleImage({
    required this.id,
    required this.image,
    required this.imageUrl,
  });

  static PuzzleImage fromJson(Map<String, dynamic> json) {
    return PuzzleImage(
      id: json['id'],
      image: Image.network(json['urls']['full']),
      imageUrl: json['urls']['full'],
    );
  }
}

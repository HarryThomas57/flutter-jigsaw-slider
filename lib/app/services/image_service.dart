import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jigsaw_slider/app/types/puzzle_image.dart';

import '../../secrets.dart';

class ImageService {
  Future<PuzzleImage> getImage(String topic) async {
    var response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/random/?client_id=$UNSPLASH_ACCESS_KEY'));
    if (response.statusCode == 200) {
      return PuzzleImage.fromJson(jsonDecode(response.body));
    } else {
      if (response.statusCode == 400) {
        throw Exception('Bad Request');
      } else if (response.statusCode == 401) {
        throw Exception('Bad Key');
      }
      throw Exception('Something went wrong');
    }
  }

  Future<void> saveImage(PuzzleImage image) async {
    print('Save Image');
  }
}

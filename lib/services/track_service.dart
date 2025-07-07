import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:product_app/models/track_model.dart';

Future<List<Tracks>> getTracks() async {
  final response = await http.get(Uri.parse('https://api.deezer.com/artist/152856922/top?limit=20'));

  if (response.statusCode == 200) {
    List<Tracks> tracks = [];
    final data = json.decode(response.body);
    for (var item in data['data']) {
      tracks.add(Tracks.fromJson(item));
    }
    return tracks;
  } else {
    throw Exception('Failed to load tracks');
  }
}
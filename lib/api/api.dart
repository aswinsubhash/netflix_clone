import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix/series_details/series_details.dart';

Future<List<SeriesDetails>> fetchAllSeries({required category}) async {
  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/tv/$category?api_key=b2371a40425c31a63b6b898528482e50'));
      //print(response.body);

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    Iterable list = result["results"];
    return list.map((series) => SeriesDetails.fromJson(series)).toList();
  
  } else {
    throw Exception("Failed to load movie");
  }
}
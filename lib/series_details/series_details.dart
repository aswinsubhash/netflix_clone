import 'package:json_annotation/json_annotation.dart';


part 'series_details.g.dart';

@JsonSerializable()
class SeriesDetails {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;

  int? id;

  @JsonKey(name: 'original_name')
  String? originalName;

  String? overview;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  @JsonKey(name: 'first_air_date')
  String? firstAirate;

  SeriesDetails({
    this.backdropPath,
    this.id,
    this.originalName,
    this.overview,
    this.posterPath,
    this.firstAirate
  });

  factory SeriesDetails.fromJson(Map<String, dynamic> json) {
    return _$SeriesDetailsFromJson(json);
  }
}

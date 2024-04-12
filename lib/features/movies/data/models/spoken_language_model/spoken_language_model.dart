import 'package:flutter_movie_box/features/movies/domain/entities/spoken_language.dart';

import 'package:json_annotation/json_annotation.dart';

part 'spoken_language_model.g.dart';

@JsonSerializable()
class SpokenLanguageModel extends SpokenLanguage {
  SpokenLanguageModel(
      {required super.iso6391,
      required super.name,
      required super.englishName});

  factory SpokenLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageModelToJson(this);
}

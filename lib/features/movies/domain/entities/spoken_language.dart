import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SpokenLanguage extends Equatable {
  @JsonKey(name: 'english_name')
  final String englishName;

  @JsonKey(name: 'iso_639_1')
  final String iso6391;

  @JsonKey(name: 'name')
  final String name;

  const SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  @override
  String toString() {
    return 'SpokenLanguage{englishName: $englishName, iso6391: $iso6391, name: $name}';
  }

  @override
  List<Object?> get props => [englishName, iso6391, name];
}

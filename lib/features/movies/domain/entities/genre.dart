import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Genre extends Equatable {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  @override
  String toString() {
    return 'Genre{id: $id, name: $name}';
  }

  @override
  List<Object?> get props => [id, name];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'point.g.dart';

@JsonSerializable()
class Point extends Equatable {
  Point({
    required this.longitude,
    required this.latitude,
  });

  final double? longitude;
  final double? latitude;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);

  @override
  List<Object?> get props => [
        longitude,
        latitude,
      ];
}

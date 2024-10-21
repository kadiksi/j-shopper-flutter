import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'history.g.dart';

@JsonSerializable()
class History extends Equatable {
  History({
    required this.id,
    required this.createdDate,
    required this.action,
    required this.point,
    required this.courierId,
  });

  final int? id;
  final DateTime? createdDate;
  final String? action;
  final dynamic point;
  final int? courierId;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);

  Map<String, dynamic> toJson() => _$HistoryToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdDate,
        action,
        point,
        courierId,
      ];
}

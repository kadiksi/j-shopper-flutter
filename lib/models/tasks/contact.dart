import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact extends Equatable {
  Contact({
    required this.id,
    required this.createdDate,
    required this.companyName,
    required this.name,
    required this.phone,
    required this.comments,
    required this.dateFrom,
    required this.dateTo,
    required this.workingTime,
    required this.workSchedule,
  });

  final int? id;
  final DateTime? createdDate;
  final String? companyName;
  final String? name;
  final String? phone;
  final dynamic comments;
  final DateTime? dateFrom;
  final DateTime? dateTo;
  final dynamic workingTime;
  final List<dynamic>? workSchedule;

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdDate,
        companyName,
        name,
        phone,
        comments,
        dateFrom,
        dateTo,
        workingTime,
        workSchedule,
      ];
}

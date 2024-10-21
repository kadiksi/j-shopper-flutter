import 'package:equatable/equatable.dart';
import 'package:j_courier/models/tasks/point.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address extends Equatable {
  Address({
    required this.id,
    required this.createdDate,
    required this.cityId,
    required this.address,
    required this.street,
    required this.streetAbr,
    required this.building,
    required this.flat,
    required this.entrance,
    required this.floor,
    required this.intercom,
    required this.description,
    required this.point,
  });

  final int? id;
  final DateTime? createdDate;
  final int? cityId;
  final String? address;
  final dynamic street;
  final dynamic streetAbr;
  final String? building;
  final String? flat;
  final String? entrance;
  final String? floor;
  final String? intercom;
  final dynamic description;
  final Point? point;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdDate,
        cityId,
        address,
        street,
        streetAbr,
        building,
        flat,
        entrance,
        floor,
        intercom,
        description,
        point,
      ];
}

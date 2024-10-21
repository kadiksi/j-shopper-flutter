import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  Product({
    required this.id,
    required this.createdDate,
    required this.productId,
    required this.name,
    required this.isDelivered,
    required this.quantity,
    required this.length,
    required this.width,
    required this.weight,
    required this.height,
    required this.price,
    required this.barcode,
    required this.comment,
  });

  final int? id;
  final DateTime? createdDate;
  final int? productId;
  final String? name;
  final bool? isDelivered;
  final int? quantity;
  final int? length;
  final int? width;
  final int? weight;
  final int? height;
  final int? price;
  final dynamic barcode;
  final dynamic comment;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdDate,
        productId,
        name,
        isDelivered,
        quantity,
        length,
        width,
        weight,
        height,
        price,
        barcode,
        comment,
      ];
}

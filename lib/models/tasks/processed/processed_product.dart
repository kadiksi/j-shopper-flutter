// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:j_courier/models/tasks/product.dart';
part 'processed_product.g.dart';

@JsonSerializable()
class ProcessedProduct extends Equatable {
  final List<Product>? added;
  final List<Product>? replaced;
  final List<Product>? withoutChange;
  final List<Product>? notAvailable;
  const ProcessedProduct({
    this.added,
    this.replaced,
    this.withoutChange,
    this.notAvailable,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'added': added?.map((x) => x.toMap()).toList(),
      'replaced': replaced?.map((x) => x.toMap()).toList(),
      'withoutChange': withoutChange?.map((x) => x.toMap()).toList(),
      'notAvailable': notAvailable?.map((x) => x.toMap()).toList(),
    };
  }

  factory ProcessedProduct.fromMap(Map<String, dynamic> map) {
    return ProcessedProduct(
      added: map['added'] != null
          ? List<Product>.from(
              (map['added'] as List<dynamic>).map<Product?>(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      replaced: map['replaced'] != null
          ? List<Product>.from(
              (map['replaced'] as List<dynamic>).map<Product?>(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      withoutChange: map['withoutChange'] != null
          ? List<Product>.from(
              (map['withoutChange'] as List<dynamic>).map<Product?>(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      notAvailable: map['notAvailable'] != null
          ? List<Product>.from(
              (map['notAvailable'] as List<dynamic>).map<Product?>(
                (x) => Product.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProcessedProduct.fromJson(String source) =>
      ProcessedProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  ProcessedProduct copyWith({
    List<Product>? added,
    List<Product>? replaced,
    List<Product>? withoutChange,
    List<Product>? notAvailable,
  }) {
    return ProcessedProduct(
      added: added ?? this.added,
      replaced: replaced ?? this.replaced,
      withoutChange: withoutChange ?? this.withoutChange,
      notAvailable: notAvailable ?? this.notAvailable,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [added, replaced, withoutChange, notAvailable];
  }
}

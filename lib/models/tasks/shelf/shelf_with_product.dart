// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/shelf/shelf.dart';

class ShelfWithProduct {
  Shelf shelf;
  List<Product> products;
  ShelfWithProduct({
    required this.shelf,
    required this.products,
  });
}

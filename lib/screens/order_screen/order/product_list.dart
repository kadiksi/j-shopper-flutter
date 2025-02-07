import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/shelf/shelf.dart';
import 'package:j_courier/models/tasks/shelf/shelf_with_product.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/router/router.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

Widget buildMultipleExpandableProductLists(
  Task task,
  List<Shelf> shelfs,
  ThemeData theme,
  BuildContext context,
  List<Product> selectedItems,
  ProductStatus productStatus,
  void Function(VoidCallback fn) setState,
) {
  List<Widget> views = [];
  List<ShelfWithProduct> shelfWithProducts =
      getnerateShleProductList(shelfs, task.productList!, productStatus);

  for (var element in shelfWithProducts) {
    views.add(ExpansionTile(
      childrenPadding: EdgeInsets.zero,
      initiallyExpanded: false,
      title: Text('${element.shelf.shelf_name}',
          style: theme.textTheme.bodyMedium),
      subtitle:
          Text('Завершено 6 из 8 Subtitle', style: theme.textTheme.bodySmall),
      children: element.products.map((product) {
        final isSelected = selectedItems.contains(product);
        return GestureDetector(
            onLongPress: () {
              if (selectedItems.isEmpty) {
                setState(() {
                  selectedItems.add(product);
                });
              }
            },
            onTap: () {
              if (selectedItems.isNotEmpty) {
                setState(() {
                  if (isSelected) {
                    selectedItems.remove(product);
                  } else {
                    selectedItems.add(product);
                  }
                });
              } else {
                AutoRouter.of(context).push(ProductRoute(product: product));
              }
            },
            child: ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                leading: Icon(
                  Icons.check_circle,
                  color: isSelected ? Colors.lightGreenAccent : null,
                ),
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ('${product.status}№ ${product.jmartProductId}'),
                              style: theme.textTheme.bodyLarge,
                            ),
                            Text(
                              '${product.productName}',
                              style: theme.textTheme.bodyMedium,
                            ),
                            divider8,
                            Text(
                              '${product.price}',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('${product.price}₸ x ${product.quantity} шт'),
                      ],
                    ),
                  ],
                ),
                trailing: Image.network(
                  '${product.imageUrl}',
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const Center(
                      child:
                          CircularProgressIndicator(), // Show loading indicator
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/svg/tabs/clock.svg',
                        fit: BoxFit.cover);
                  },
                )
                // : Image.network(
                //   '${product.imageUrl}',
                //   width: 62,
                //   height: 62,
                // ),
                ));
      }).toList(),
    ));
  }

  return ListView(
    children: views,
  );
}

getnerateShleProductList(List<Shelf> shelfs, List<Product> productList,
    ProductStatus productStatus) {
  List<ShelfWithProduct> shelfWithProducts = [];
  shelfs.forEach((shelf) {
    List<Product> products = [];
    productList.forEach((product) {
      if (product.companyShelf == shelf.id &&
          product.status?.name == productStatus.name) {
        print('${product.status?.name} / ${productStatus.name}');
        products.add(product);
      }
    });
    if (products.isNotEmpty) {
      shelfWithProducts.add(ShelfWithProduct(shelf: shelf, products: products));
    }
  });
  shelfWithProducts.forEach((s) {
    print('${s.products}///////////////');
  });
  return shelfWithProducts;
}

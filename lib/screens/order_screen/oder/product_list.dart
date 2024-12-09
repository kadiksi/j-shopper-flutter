import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/router/router.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

Widget buildMultipleExpandableProductLists(
  Task task,
  ThemeData theme,
  BuildContext context,
  List<int> selectedItems,
  void Function(VoidCallback fn) setState,
) {
  final categoryProducts = [
    'Молочные продукты',
    'Завершено 6 из 8',
    'Молочные продукты',
    'Завершено 6 из 8'
  ];
  List<Widget> views = [];
  for (var element in categoryProducts) {
    List<Product> products = task.productList!;

    views.add(ExpansionTile(
      childrenPadding: EdgeInsets.zero,
      initiallyExpanded: false,
      title: Text(element, style: theme.textTheme.bodyMedium),
      subtitle:
          Text('Завершено 6 из 8 Subtitle', style: theme.textTheme.bodySmall),
      children: products.map((product) {
        final isSelected = selectedItems.contains(product.jmartProductId);
        return GestureDetector(
            onLongPress: () {
              if (selectedItems.isEmpty) {
                setState(() {
                  selectedItems.add(product.jmartProductId!);
                });
              }
            },
            onTap: () {
              if (selectedItems.isNotEmpty) {
                setState(() {
                  if (isSelected) {
                    selectedItems.remove(product.jmartProductId!);
                  } else {
                    selectedItems.add(product.jmartProductId!);
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
                            ('№ ${product.jmartProductId}'),
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
                  const Row(
                    children: [
                      Text('1534₸ x 4 ш  т'),
                    ],
                  ),
                ],
              ),
              trailing: Image.network(
                'https://images.igdb.com/igdb/image/upload/t_cover_big/ss6bi7081my4mzebjkzb.png',
                width: 62,
                height: 62,
              ),
            ));
      }).toList(),
    ));
  }

  return ListView(
    children: views,
  );
}

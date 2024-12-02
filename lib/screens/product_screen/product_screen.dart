import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/screens/product_screen/product_replacement_screen.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

@RoutePage()
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductScreen> {
  final TextEditingController priceController = TextEditingController(text: '');

  int total = 0;
  int quantity = 0;

  void _calculateTotal() {
    int price = widget.product.price ?? 0;
    setState(() {
      total = price * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Product product = widget.product;
    priceController.text = '${product.price}';
    List<Product> products = [product];

    if (quantity == 0) {
      quantity = product.quantity!;
    }
    if (total == 0) {
      total = (product.price! * quantity);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).product_id('${product.jmartProductId}')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Center(
                child: Image.network(
                  'https://images.igdb.com/igdb/image/upload/t_cover_big/ss6bi7081my4mzebjkzb.png',
                  width: double.infinity,
                  height: 262,
                ),
              ),
              divider20,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '${product.productName}',
                      style: theme.textTheme.bodyLarge,
                    ),
                    divider20,
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12),
                      child: Text('${widget.product.price}'),
                    ),
                    divider20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).quantity,
                          style: theme.textTheme.bodyLarge,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 26),
                                child: Text(
                                  '$quantity',
                                  style: theme.textTheme.bodyLarge,
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        visualDensity: VisualDensity.compact,
                                        onPressed: () {
                                          if (quantity > 1) {
                                            setState(() {
                                              quantity--;
                                              _calculateTotal();
                                            });
                                          }
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        visualDensity: VisualDensity.compact,
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                            _calculateTotal();
                                          });
                                        },
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    divider20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.of(context).total,
                          style: theme.textTheme.bodyLarge,
                        ),
                        Text(
                          '$total ₸',
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: theme.elevatedButtonTheme.style!.copyWith(
                          backgroundColor: WidgetStateProperty.all(
                              theme.colorScheme.secondaryContainer)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(S.of(context).collected,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: theme.colorScheme.secondary)),
                    )),
                divider10,
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(S.of(context).accept_selected,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: theme.colorScheme.surface)),
                    )),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showModelReplaceProduct(context, products);
                      },
                      child: Text(S.of(context).replace_product,
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: theme.colorScheme.surface)),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showModelReplaceProduct(BuildContext context, List<Product> products) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ProductReplacementSheet(
          products: products,
          isReplace: true,
          action: replaceProduct,
          title: S.of(context).replace_product),
    );
  }

  void replaceProduct() {
    print('Replace product');
  }
}

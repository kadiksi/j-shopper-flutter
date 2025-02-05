import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/product/product_bloc.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/repositories/product/product_abstarct_repository.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/swap_confirmation_dialog.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

class ProductReplacementSheet extends StatefulWidget {
  ProductReplacementSheet(
      {super.key,
      required this.mainProduct,
      required this.title,
      required this.replaceProduct});
  final Product mainProduct;
  final Function(Product product, int replacedProductId) replaceProduct;
  final String title;

  @override
  _ProductReplacementSheetState createState() =>
      _ProductReplacementSheetState(products: []);
}

class _ProductReplacementSheetState extends State<ProductReplacementSheet> {
  final _productBloc = ProductBloc(
    GetIt.I<ProductAbstractRepository>(),
  );
  Timer? timer;
  List<Product> products = List.empty();

  TextEditingController searchController = TextEditingController();
  List<Product> filteredProducts = [];
  late DraggableScrollableSheet sheet;

  _ProductReplacementSheetState({required this.products});

  @override
  void initState() {
    super.initState();
    filteredProducts = products;
    searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    searchController.removeListener(_filterProducts);
    searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    final query = searchController.text.toLowerCase();
    timer?.cancel();
    timer = Timer(const Duration(seconds: 1), () async {
      _productBloc.add(LoadProdactList(search: query));
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    sheet = DraggableScrollableSheet(
      expand: true,
      maxChildSize: 1.0,
      minChildSize: 0.9,
      initialChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: theme.textTheme.headlineLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              divider16,
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: S.of(context).enter_product_name,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: Colors.grey[200],
                  filled: true,
                ),
              ),
              divider16,
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = filteredProducts[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                'https://images.igdb.com/igdb/image/upload/t_cover_big/ss6bi7081my4mzebjkzb.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            divider16,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${product.productName}',
                                    style: theme.textTheme.headlineMedium,
                                  ),
                                  divider4,
                                  Text(
                                    '${product.productCode}',
                                    style: theme.textTheme.headlineSmall,
                                  ),
                                ],
                              ),
                            ),
                            divider16,
                            Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.orange[50],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                    'assets/svg/swap.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                  onPressed: () {
                                    // if (widget.isReplace) {
                                    showReplaceConfirmationModalSheet(
                                        widget.mainProduct.productId!,
                                        product,
                                        S
                                            .of(context)
                                            .replace_product_confirmation_question,
                                        S
                                            .of(context)
                                            .Replacement_of_good_will_result,
                                        S.of(context).replace_product,
                                        'assets/svg/three_dots_replace_product.svg',
                                        widget.replaceProduct);
                                    // } else {
                                    //   showReplaceConfirmationModalSheet(
                                    //       widget.mainProduct.productId!
                                    //           .toString(),
                                    //       product,
                                    //       S.of(context).add_product_question,
                                    //       S.of(context).cant_cancel_action,
                                    //       S.of(context).add_product,
                                    //       'assets/svg/qr_add_order.svg',
                                    //       widget.replace);
                                    // }
                                  },
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<ProductBloc, ProductState>(
                bloc: _productBloc,
                builder: (context, state) {
                  return sheet;
                },
                listener: (BuildContext context, ProductState state) {
                  if (state is ProductSuccess) {
                    print("From ProductSuccess Listener");
                    filteredProducts = state.productList;
                    setState(() {
                      filteredProducts = state.productList;
                    });
                  }
                })));
  }

  void showReplaceConfirmationModalSheet(
      int replacedProductId,
      Product product,
      String title,
      String tip,
      String buttonText,
      String icon,
      Function(Product product, int id) replace) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return SwapConfirmationDialog(
            replacedProductId: replacedProductId,
            product: product,
            confirmProductSwap: replace,
            title: title,
            tip: tip,
            buttonText: buttonText,
            icon: icon);
      },
    );
  }
}

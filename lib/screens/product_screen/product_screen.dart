import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:j_courier/blocks/product/product_bloc.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/product.dart';
import 'package:j_courier/repositories/product/product_abstarct_repository.dart';
import 'package:j_courier/screens/product_screen/product_replacement_screen.dart';
import 'package:j_courier/screens/widgets/alerts/alert.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

@RoutePage()
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductScreen> {
  final _productBloc = ProductBloc(GetIt.I<ProductAbstractRepository>());
  final TextEditingController priceController = TextEditingController();
  double total = 0;
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    quantity = widget.product.quantity ?? 1;
    total = (widget.product.price ?? 0) * quantity;
    priceController.text = '${widget.product.price}';
  }

  void _calculateTotal() {
    setState(() {
      total = (widget.product.price ?? 0) * quantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Product product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).product_id('${product.jmartProductId}')),
      ),
      body: BlocConsumer<ProductBloc, ProductState>(
        bloc: _productBloc,
        listener: (context, state) {
          if (state is ProductFailure) {
            showAlert(context, ' ', state.exception.toString());
          } else if (state is ProductReplaceSuccess ||
              state is ProductStatusSuccess ||
              state is ProductReturnSuccess) {
            Navigator.of(context).pop('refreshData');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Image.network(
                      product.imageUrl ?? '',
                      width: 200,
                      height: 262,
                      fit: BoxFit.cover,
                    ),
                  ),
                  divider20,
                  Text(product.productName!, style: theme.textTheme.bodyLarge),
                  divider20,
                  _buildPriceContainer(),
                  divider20,
                  _buildQuantitySelector(theme),
                  divider20,
                  _buildTotalAmount(theme),
                  divider20,
                  ...getButtonsList(product, theme),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPriceContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      child: Text('${widget.product.price}'),
    );
  }

  Widget _buildQuantitySelector(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(S.of(context).quantity, style: theme.textTheme.bodyLarge),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: quantity > 1
                  ? () => setState(() {
                        quantity--;
                        _calculateTotal();
                      })
                  : null,
            ),
            Text('$quantity', style: theme.textTheme.bodyLarge),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => setState(() {
                quantity++;
                _calculateTotal();
              }),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTotalAmount(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(S.of(context).total, style: theme.textTheme.bodyLarge),
        Text('$total ₸',
            style: GoogleFonts.notoSans(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              height: 24 / 17,
              letterSpacing: -0.408,
            ).copyWith()),
      ],
    );
  }

  List<Widget> getButtonsList(Product product, ThemeData theme) {
    List<Widget> items = [];
    if (product.status == ProductStatus.NOT_AVAILABLE) {
      items.add(getLightOrangeButton(
          S.of(context).return_to_processing, product, ProductStatus.NEW));
    }
    if (product.status == ProductStatus.PROCESSED) {
      items.add(getLightOrangeButton(
          S.of(context).return_to_processing, product, ProductStatus.NEW));
    }

    if (product.status == ProductStatus.NEW) {
      if (product.productType == ProductType.ORIGINAL) {
        items.add(SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                product.quantity = quantity;
                showModelReplaceProduct(context, product);
              },
              child: Text(S.of(context).replace_product,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.surface)),
            )));
        items.add(divider10);
        items.add(getLightOrangeButton(
            S.of(context).collected, product, ProductStatus.PROCESSED));
      }
      if (product.productType == ProductType.REPLACED) {
        items.add(SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // setProducStatus(product, ProductStatus.NOT_AVAILABLE);
                _productBloc.add(ReturnInitialProdact(product: product));
              },
              child: Text(S.of(context).remove_product,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.surface)),
            )));
        items.add(divider10);
        items.add(getLightOrangeButton(
            S.of(context).collected, product, ProductStatus.PROCESSED));
      }
      if (product.productType == ProductType.ADDED) {
        items.add(SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                setProducStatus(product, ProductStatus.NOT_AVAILABLE);
                // _productBloc.add(ReturnInitialProdact(product: product));
              },
              child: Text(S.of(context).remove_product,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.surface)),
            )));
        items.add(divider10);
        items.add(getLightOrangeButton(
            S.of(context).collected, product, ProductStatus.PROCESSED));
      }
    }
    return items;
  }

  void showModelReplaceProduct(BuildContext context, Product mainProduct) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => ProductReplacementSheet(
        mainProduct: mainProduct,
        replaceProduct: replaceProduct,
        title: S.of(context).replace_product,
      ),
    );
  }

  void replaceProduct(Product product, int replacedProductId) {
    _productBloc.add(
      ReplaceProdact(product: product, replacedProductId: replacedProductId),
    );
  }

  void setProducStatus(Product product, ProductStatus status) {
    product.quantity = quantity;
    _productBloc.add(ChangeProdactStatus(products: [product], status: status));
  }

  Widget getLightOrangeButton(
      String text, Product product, ProductStatus status) {
    final theme = Theme.of(context);
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: theme.elevatedButtonTheme.style!.copyWith(
              backgroundColor: WidgetStateProperty.all(
                  theme.colorScheme.secondaryContainer)),
          onPressed: () {
            setProducStatus(product, status);
          },
          child: Text(text,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: theme.colorScheme.secondary)),
        ));
  }
}

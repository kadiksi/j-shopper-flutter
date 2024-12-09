// import 'dart:async';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:get_it/get_it.dart';
// import 'package:j_courier/blocks/order/order_bloc.dart';
// import 'package:j_courier/generated/l10n.dart';
// import 'package:j_courier/models/tasks/product.dart';
// import 'package:j_courier/models/tasks/task.dart';
// import 'package:j_courier/repositories/list/list_abstarct_repository.dart';
// import 'package:j_courier/router/router.dart';
// import 'package:j_courier/screens/order_screen/oder/oder.dart';
// import 'package:j_courier/screens/order_screen/oder/order_info.dart';
// import 'package:j_courier/screens/order_screen/oder/product_list.dart';
// import 'package:j_courier/screens/product_screen/product_replacement_screen.dart';
// import 'package:j_courier/screens/widgets/bottom_sheet/cancel_order.dart';
// import 'package:j_courier/screens/widgets/bottom_sheet/order_options.dart';
// import 'package:j_courier/screens/widgets/bottom_sheet/return_order.dart';
// import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';
// import 'package:j_courier/screens/widgets/errors/failed_request.dart';

// @RoutePage()
// class OrderScreen extends StatefulWidget {
//   const OrderScreen({
//     super.key,
//     required this.task,
//   });

//   final Task task;

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   final _listBloc = OrderBloc(
//     GetIt.I<ListAbstractRepository>(),
//   );
//   List<int> selectedItems = [];

//   @override
//   void initState() {
//     _listBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Scaffold(
//       body: RefreshIndicator(
//         onRefresh: () async {
//           final completer = Completer();
//           _listBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
//           return completer.future;
//         },
//         child: BlocBuilder<OrderBloc, OrderState>(
//           bloc: _listBloc,
//           builder: (context, state) {
//             if (state is OrderSuccess) {
//               return orderView(
//                   state.tasks, theme, context, selectedItems, setState);
//             }
//             if (state is OrderFailure) {
//               return FailedRequest(callback: callback);
//             }
//             return const Center(child: CircularProgressIndicator());
//           },
//         ),
//       ),
//     );
//   }

//   void callback() {
//     _listBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
//   }
// }

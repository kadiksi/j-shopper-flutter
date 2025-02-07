import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/models/tasks/processed/processed_task.dart';
// import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/router/router.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/confirm_order_dialog.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';
import 'package:j_courier/screens/widgets/list/task_acctive_tile.dart';

import '../../../blocks/list/list_bloc.dart';
import '../../../repositories/list/order_abstarct_repository.dart';
// import '../../widgets/list/task_tile.dart';

@RoutePage()
class ActiveOrders extends StatefulWidget {
  const ActiveOrders({super.key, required this.isFinished});

  final bool isFinished;

  @override
  State<ActiveOrders> createState() => _ActiveOrdersState();
}

class _ActiveOrdersState extends State<ActiveOrders> {
  final _listBloc = ListBloc(
    GetIt.I<OrderAbstractRepository>(),
  );

  List<int> selectedItems = [];
  @override
  void initState() {
    loadAccepted();
    super.initState();
  }

  void goTo(ProcessedTask task) {
    AutoRouter.of(context).push(ActiveOrderRoute(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _listBloc.add(LoadAcceptedList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<ListBloc, ListState>(
          bloc: _listBloc,
          builder: (context, state) {
            if (state is ListActiveSuccess) {
              return Stack(children: [
                ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.tasks.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.transparent,
                  ),
                  itemBuilder: (context, i) {
                    final task = state.tasks[i];
                    return TaskActiveTile(
                        task: task,
                        selectedItems: selectedItems,
                        setState: setState,
                        goTo: goTo);
                  },
                ),
                // Positioned(
                //   bottom: 16,
                //   left: 16,
                //   right: 16,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       showModalSheet();
                //     },
                //     child: Text(
                //       S.of(context).commit_all_orders,
                //       style: const TextStyle(fontSize: 16, color: Colors.white),
                //     ),
                //   ),
                // ),
              ]);
            }
            if (state is ListFailure) {
              return FailedRequest(callback: loadAccepted);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void loadAccepted() {
    _listBloc.add(LoadActiveList(isFinished: widget.isFinished));
  }

  void showModalSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return ConfirmOrderDialog();
      },
    );
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/router/router.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/confirm_order_dialog.dart';
import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';

import '../../../blocks/list/list_bloc.dart';
import '../../../repositories/list/list_abstarct_repository.dart';
import '../../widgets/list/task_tile.dart';

@RoutePage()
class AcceptedOrders extends StatefulWidget {
  const AcceptedOrders({
    super.key,
  });

  @override
  State<AcceptedOrders> createState() => _AcceptedOrdersState();
}

class _AcceptedOrdersState extends State<AcceptedOrders> {
  final _listBloc = ListBloc(
    GetIt.I<ListAbstractRepository>(),
  );

  List<int> selectedItems = [];
  @override
  void initState() {
    _listBloc.add(LoadList());
    super.initState();
  }

  void goTo(Task task) {
    AutoRouter.of(context).push(AcceptedOrderRoute(task: task));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _listBloc.add(LoadList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<ListBloc, ListState>(
          bloc: _listBloc,
          builder: (context, state) {
            if (state is ListSuccess) {
              return Stack(children: [
                ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.tasks.length,
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.transparent,
                  ),
                  itemBuilder: (context, i) {
                    final task = state.tasks[i];
                    return TaskTile(
                        task: task,
                        selectedItems: selectedItems,
                        setState: setState,
                        goTo: goTo);
                  },
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalSheet();
                    },
                    child: Text(
                      S.of(context).commit_all_orders,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ]);
            }
            if (state is ListFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Something went wrong',
                      style: theme.textTheme.headlineMedium,
                    ),
                    Text(
                      'Please try againg later',
                      style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                    ),
                    divider30,
                    TextButton(
                      onPressed: () {
                        _listBloc.add(LoadList());
                      },
                      child: const Text('Try againg'),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
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

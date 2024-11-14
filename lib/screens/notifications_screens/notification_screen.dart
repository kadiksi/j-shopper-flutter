import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/router/router.dart';
import 'package:j_courier/screens/notifications_screens/notification_data_tile.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/confirm_order_dialog.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';

import '../../../blocks/list/list_bloc.dart';
import '../../../repositories/list/list_abstarct_repository.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
    return Scaffold(
      backgroundColor: Color(0xFFF3F4F5),
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
              return ListView.separated(
                reverse: true,
                padding: const EdgeInsets.only(top: 16),
                itemCount: state.tasks.length,
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.transparent,
                ),
                itemBuilder: (context, i) {
                  final task = state.tasks[i];
                  return NotificationDataTile(task: task);
                },
              );
            }
            if (state is ListFailure) {
              return FailedRequest(callback: callback);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  void callback() {
    _listBloc.add(LoadList());
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

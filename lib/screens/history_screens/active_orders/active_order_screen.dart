import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:j_courier/blocks/order/order_bloc.dart';
import 'package:j_courier/generated/l10n.dart';
import 'package:j_courier/models/tasks/cacelation_reasons/cancelation_reasons.dart';
import 'package:j_courier/models/tasks/task.dart';
import 'package:j_courier/repositories/list/list_abstarct_repository.dart';
import 'package:j_courier/screens/widgets/bottom_sheet/cancel_order.dart';

import 'package:j_courier/screens/widgets/box_decorations/dividers.dart';
import 'package:j_courier/screens/widgets/errors/failed_request.dart';

@RoutePage()
class ActiveOrderScreen extends StatefulWidget {
  const ActiveOrderScreen({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  State<ActiveOrderScreen> createState() => _ActiveOrderScreenState();
}

class _ActiveOrderScreenState extends State<ActiveOrderScreen> {
  final _listBloc = OrderBloc(
    GetIt.I<OrderAbstractRepository>(),
  );
  List<CancelationReasons> reasons = [];
  List<int> selectedItems = [];

  @override
  void initState() {
    _listBloc.add(LoadCancelationReasons());
    loadOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
              S.of(context).order_number('${widget.task.externalOrderId}')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<OrderBloc, OrderState>(
              bloc: _listBloc,
              builder: (context, state) {
                if (state is OrderShelfSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Получатель',
                        style: theme.textTheme.labelSmall,
                      ),
                      divider4,
                      Text(
                        'Диана Ш.',
                        style: theme.textTheme.headlineLarge,
                      ),
                      divider16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Плановая дата',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            '25.02.2024  16:00',
                            style: theme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                      divider8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Итого',
                            style: theme.textTheme.headlineMedium,
                          ),
                          Text(
                            '2 578 ₸',
                            style: theme.textTheme.headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      divider16,
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFDCDCDD),
                              width: 1.0,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '12 товаров',
                                  style: theme.textTheme.headlineMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '2 отсутствуют',
                                  style: theme.textTheme.headlineMedium,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Text('смотреть'),
                                ),
                                SvgPicture.asset(
                                  'assets/svg/arrow_order.svg',
                                  width: 24,
                                  height: 24,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      divider16,
                      Card(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Курьер в пути',
                                style: theme.textTheme.headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              divider8,
                              const Text(
                                  'Курьер сообщит вам номер заказа при заборе'),
                              divider8,
                              Row(
                                children: List.generate(3, (index) {
                                  return Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: index < 2
                                            ? Colors.orange
                                            : Colors.grey[300],
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            blurRadius: 5,
                                            offset: const Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      height: 4,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                      divider16,
                      Card(
                        color: Colors.grey[100],
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Заказ изменен',
                                style: theme.textTheme.headlineMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              divider8,
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Добавлено'),
                                  Text('2 товара'),
                                ],
                              ),
                              divider4,
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Заменено'),
                                  Text('2 товара'),
                                ],
                              ),
                              divider8,
                              const Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.green),
                                  SizedBox(width: 8),
                                  Text('Покупатель доплатил заказ'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showModelCancelOrder(context, reasons);
                          },
                          child: Text(S.of(context).cancel_order),
                        ),
                      ),
                    ],
                  );
                }
                if (state is OrderFailure) {
                  return FailedRequest(callback: loadOrder);
                }
                return const Center(child: CircularProgressIndicator());
              },
              listener: (BuildContext context, OrderState state) {
                if (state is OrderCancelReasonSuccess) {
                  reasons = state.cancelationReasons;
                  print("From OrderCancelReasonSuccess Listener");
                }
              }),
        ));
  }

  void loadOrder() {
    _listBloc.add(LoadOrder(id: int.parse(widget.task.externalOrderId!)));
  }
}

void showModelCancelOrder(
    BuildContext context, List<CancelationReasons> reasons) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => ReasonSelectionSheet(reasons: reasons),
  );
}

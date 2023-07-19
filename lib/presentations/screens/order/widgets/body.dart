import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/common_blocs/order/order_bloc.dart';
import 'package:beauty_skin/presentations/screens/network_error/network_error.dart';
import 'package:beauty_skin/presentations/screens/order/widgets/order_item_widget.dart';
import 'package:beauty_skin/presentations/widgets/others/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state.status == OrderStatus.loadingOrdersFailure && state.orders.isEmpty) {
          Navigator.of(context).push(
            NetworkError.route(
              onRetry: () {
                context.read<OrderBloc>().add(LoadMyOrders());
                Navigator.of(context).pop();
              },
            ),
          );
        }
      },
      child: const OrderItemList(),
    );
  }
}

class OrderItemList extends StatelessWidget {
  const OrderItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((OrderBloc bloc) => bloc.state.status);
    final orders = context.select((OrderBloc bloc) => bloc.state.orders);

    if ([OrderStatus.initial, OrderStatus.loadingOrders].contains(status)) {
      context.read<OrderBloc>().add(LoadMyOrders());
      return const Loading();
    }

    if (orders.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("empty".tr(context)),
            ElevatedButton(
              onPressed: () {
                context.read<OrderBloc>().add(LoadMyOrders());
              },
              child: Text("refresh".tr(context)),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        context.read<OrderBloc>().add(LoadMyOrders());
      },
      child: ListView.separated(
        padding: const EdgeInsets.all(kDefaultPadding),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderItemWidget(order: orders[index]);
        },
        separatorBuilder: (_, __) => const SizedBox(height: kDefaultPadding),
      ),
    );
  }
}

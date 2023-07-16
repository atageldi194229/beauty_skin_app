import 'dart:async';

import 'package:beauty_skin/data/models/order/order.dart';
import 'package:beauty_skin/data/repositories/order_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final _orderRepository = OrderRepository();

  OrderBloc() : super(const OrderState.initial()) {
    on<AddOrder>(_onAddOrder);
    on<LoadMyOrders>(_onLoadMyOrders);
  }

  FutureOr<void> _onAddOrder(AddOrder event, Emitter<OrderState> emit) async {
    try {
      emit(state.copyWith(status: OrderStatus.loadingOrderSent));

      await _orderRepository.createOrder(event.newOrderModel);

      emit(state.copyWith(status: OrderStatus.loadingOrderSentSucceeded));
    } catch (e) {
      emit(state.copyWith(status: OrderStatus.loadingOrderSentFailure));
      debugPrint(e.toString());
    }
  }

  FutureOr<void> _onLoadMyOrders(LoadMyOrders event, Emitter<OrderState> emit) async {
    try {
      emit(state.copyWith(status: OrderStatus.loadingOrders));

      final orders = await _orderRepository.fetchAllOrders();

      emit(state.copyWith(
        status: OrderStatus.loadingOrdersSucceeded,
        orders: orders,
      ));
    } catch (e) {
      emit(state.copyWith(status: OrderStatus.loadingOrdersFailure));
      debugPrint(e.toString());
    }
  }
}

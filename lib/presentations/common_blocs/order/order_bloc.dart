import 'dart:async';

import 'package:beauty_skin/data/models/order_model.dart';
import 'package:beauty_skin/data/repositories/order_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final _orderRepository = OrderRepository();

  OrderBloc() : super(OrderInitial()) {
    on<AddOrder>(_onAddOrder);
  }

  FutureOr<void> _onAddOrder(
    AddOrder event,
    Emitter<OrderState> emit,
  ) async {
    try {
      await _orderRepository.createOrder(event.newOrderModel);
    } catch (e) {
      // error handling
      print(e);
    }
  }
}

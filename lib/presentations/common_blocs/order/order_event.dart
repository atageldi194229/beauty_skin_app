part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class LoadMyOrders extends OrderEvent {}

class AddOrder extends OrderEvent {
  final OrderModel newOrderModel;

  const AddOrder(this.newOrderModel);

  @override
  List<Object> get props => [newOrderModel];
}

class RemoveOrder extends OrderEvent {
  final OrderModel order;

  @override
  const RemoveOrder(this.order);

  @override
  List<Object> get props => [order];
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_bloc.dart';

enum OrderStatus {
  initial,
  loadingOrders,
  loadingOrdersFailure,
  loadingOrdersSucceeded,
  loadingOrderSent,
  loadingOrderSentFailure,
  loadingOrderSentSucceeded,
}

class OrderState extends Equatable {
  final List<OrderResponseModel> orders;
  final OrderStatus status;

  const OrderState({
    required this.status,
    this.orders = const [],
  });

  const OrderState.initial() : this(status: OrderStatus.initial);

  @override
  List<Object> get props => [status, orders];

  OrderState copyWith({
    List<OrderResponseModel>? orders,
    OrderStatus? status,
  }) {
    return OrderState(
      orders: orders ?? this.orders,
      status: status ?? this.status,
    );
  }
}

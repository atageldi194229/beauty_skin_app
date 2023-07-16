import 'package:beauty_skin/data/api/order_api.dart';
import 'package:beauty_skin/data/boxes.dart';
import 'package:beauty_skin/data/models/order/order.dart';

class OrderRepository {
  Future<OrderResponseModel> fetchOrder(int orderId) async {
    final response = await OrderApi.getOne(orderId);

    return OrderResponseModel.fromMap(response.data);
  }

  Future<void> createOrder(OrderModel order) async {
    final response = await OrderApi.create(order.toMap());

    final orderId = response.data["order_id"] as int;

    await Boxes.getOrders().add(orderId);
  }

  Future<List<OrderResponseModel>> fetchAllOrders() async {
    final orderIds = Boxes.getOrders().values.toList().reversed;

    return Future.wait(orderIds.map((orderId) => fetchOrder(orderId)));
  }

  ///Singleton factory
  static final OrderRepository _instance = OrderRepository._internal();
  factory OrderRepository() => _instance;
  OrderRepository._internal();
}

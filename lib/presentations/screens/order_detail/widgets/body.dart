import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/order/order_response_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.order});

  final OrderResponseModel order;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: ListView.builder(
        itemCount: order.products?.length ?? 0,
        itemBuilder: (context, index) {
          final orderItem = order.products![index];
          final imageUrl = orderItem.product.images.isNotEmpty ? orderItem.product.images[0] : null;

          return Card(
            child: ListTile(
              leading: LayoutBuilder(
                builder: (context, constraints) {
                  return imageUrl != null
                      ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.contain,
                          width: constraints.maxHeight,
                          height: constraints.maxHeight,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                        )
                      : Container(
                          width: constraints.maxHeight,
                          height: constraints.maxHeight,
                          color: Colors.amber,
                        );
                },
              ),
              title: Text(
                orderItem.product.nameTranslate(context),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Badge(
                label: Text(orderItem.count.toString()),
              ),
            ),
          );
        },

        // children: [
        // Container(
        //   clipBehavior: Clip.hardEdge,
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: kBorderRadius5,
        //     border: Border.all(
        //       color: const Color(0xFFE1E1E1),
        //       width: 1,
        //     ),
        //   ),
        //   child: ,
        // ),
        // ],
      ),
    );
  }
}

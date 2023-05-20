import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/list_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const ListCartItemModel(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("cart".tr(context)),
      actions: [
        IconButton(
          icon: const Icon(Icons.clear_all_rounded),
          onPressed: () => _onClearCart(context),
        )
      ],
    );
  }

  _onClearCart(BuildContext context) async {
    final response = await UtilDialog.showConfirmation(
      context,
      title: "clear_cart".tr(context),
      content: Text(
        Translate.of(context)
            .translate("all_cart_items_will_be_deleted_from_your_cart"),
        style: FONT_CONST.REGULAR_DEFAULT_20,
      ),
      confirmButtonText: "delete".tr(context),
    ) as bool;

    if (response) {
      // ignore: use_build_context_synchronously
      BlocProvider.of<CartBloc>(context).add(ClearCart());
    }
  }
}

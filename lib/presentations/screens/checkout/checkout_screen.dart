import 'package:beauty_skin/configs/router.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/delivery_address_model.dart';
import 'package:beauty_skin/data/models/order/order_model.dart';
import 'package:beauty_skin/data/models/product/product_model.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/order/order_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/profile/profile_bloc.dart';
import 'package:beauty_skin/presentations/screens/delivery_address/delivery_address_screen.dart';
import 'package:beauty_skin/presentations/widgets/form/tappable_form_field.dart';
import 'package:beauty_skin/presentations/widgets/form/text_field_additional_info.dart';
import 'package:beauty_skin/presentations/widgets/form/text_field_phone_number.dart';
import 'package:beauty_skin/presentations/widgets/form/text_field_username.dart';
import 'package:beauty_skin/presentations/widgets/others/checkout_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController additionalInfoController = TextEditingController();

  DeliveryAddressModel? deliveryAddress;
  String? deliveryAddressErrorText;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final profileState = context.read<ProfileBloc>().state;

    if (profileState is ProfileLoaded) {
      phoneController.text = profileState.phoneNumber ?? "";
      usernameController.text = profileState.username ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderBloc, OrderState>(
      listenWhen: (p, c) => p.status != c.status && c.status == OrderStatus.loadingOrderSentSucceeded,
      listener: (context, state) {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(AppRouter.MY_ORDERS);
      },
      child: Scaffold(
        appBar: AppBar(title: Text("checkout".tr(context))),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(kDefaultPadding * 4),
              child: _buildForm(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // phone_number
          TextFieldPhoneNumber(controller: phoneController),
          const SizedBox(height: kDefaultPadding),

          // username
          TextFieldUsername(controller: usernameController),
          const SizedBox(height: kDefaultPadding * 4),

          // delivery_addresses
          _buildDeliveryAddressField(),
          const SizedBox(height: kDefaultPadding * 4),

          // additional information
          TextFieldAdditionalInfo(
            controller: additionalInfoController,
          ),
          const SizedBox(height: kDefaultPadding * 4),

          // checkout button
          BlocBuilder<CartBloc, CartState>(
            buildWhen: (_, current) => current is CartLoaded,
            builder: (context, cartState) {
              double priceOfGoods = 0;

              if (cartState is CartLoaded) {
                priceOfGoods = cartState.priceOfGoods;
              }

              return BlocConsumer<OrderBloc, OrderState>(
                listener: (context, state) {
                  if (state.status == OrderStatus.loadingOrderSentSucceeded) {
                    Navigator.of(context).pop();
                  }
                },
                buildWhen: (p0, p1) => p0.status != p1.status,
                builder: (context, orderState) {
                  return CheckoutButton(
                    onTap: orderState.status == OrderStatus.loadingOrderSent
                        ? null
                        : () {
                            if (cartState is! CartLoaded) return;

                            bool hasError = false;

                            if (!_formKey.currentState!.validate()) {
                              hasError = true;
                            }

                            if (deliveryAddress == null) {
                              setState(() {
                                deliveryAddressErrorText = "empty".tr(context);
                              });
                              hasError = true;
                            }

                            if (hasError) return;

                            BlocProvider.of<OrderBloc>(context).add(AddOrder(OrderModel(
                              address: deliveryAddress!.address,
                              comment: additionalInfoController.text,
                              fullName: usernameController.text,
                              phoneNumber: phoneController.text,
                              products: cartState.cart
                                  .map((e) => OrderModelItem(
                                        productId: e.productInfo!.id.toString(),
                                        productName: e.productInfo!.nameTranslate(context),
                                        productPrice: e.price,
                                        productImage: e.productInfo!.img1!,
                                        quantity: e.quantity,
                                      ))
                                  .toList(),
                            )));
                          },
                    priceOfGoods: priceOfGoods,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  _buildDeliveryAddressField() {
    return TappableFormField(
      onTap: () {
        Object arguments = DeliveryAddressScreenArguments(
          onSelect: (deliveryAddress) {
            setState(() {
              this.deliveryAddress = deliveryAddress;
              deliveryAddressErrorText = null;
            });
          },
        );

        AppRouter().navigatorKey.currentState?.pushNamed(AppRouter.DELIVERY_ADDRESS, arguments: arguments);
      },
      labelText: "delivery_addresses".tr(context),
      prefixIcon: const Icon(IconlyBold.location),
      value: deliveryAddress != null ? deliveryAddress!.name : null,
      errorText: deliveryAddressErrorText,
    );
  }
}

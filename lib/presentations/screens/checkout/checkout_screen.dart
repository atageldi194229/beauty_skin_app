import 'package:beauty_skin/configs/router.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/delivery_address_model.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/common_blocs/cart/cart_bloc.dart';
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
  final TextEditingController additionalInfoController =
      TextEditingController();

  DeliveryAddressModel? deliveryAddress;
  String? deliveryAddressErrorText;

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
    return Scaffold(
      appBar: AppBar(title: Text("checkout".tr(context))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kdefaultPadding * 4),
            child: _buildForm(context),
          ),
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // phone_number
          TextFieldPhoneNumber(controller: phoneController),
          const SizedBox(height: kdefaultPadding),

          // username
          TextFieldUsername(controller: usernameController),
          const SizedBox(height: kdefaultPadding * 4),

          // delivery_addresses
          _buildDeliveryAddressField(),
          const SizedBox(height: kdefaultPadding * 4),

          // additional infromation
          TextFieldAdditionalInfo(
            controller: additionalInfoController,
          ),
          const SizedBox(height: kdefaultPadding * 4),

          // checkout button
          BlocBuilder<CartBloc, CartState>(
            buildWhen: (_, current) => current is CartLoaded,
            builder: (context, state) {
              double priceOfGoods = 0;

              if (state is CartLoaded) {
                priceOfGoods = state.priceOfGoods;
              }

              return CheckoutButton(
                onTap: () {},
                priceOfGoods: priceOfGoods,
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
            });
          },
        );

        AppRouter()
            .navigatorKey
            .currentState
            ?.pushNamed(AppRouter.DELIVERY_ADDRESS, arguments: arguments);
      },
      labelText: "delivery_addresses".tr(context),
      prefixIcon: const Icon(IconlyBold.location),
      value: deliveryAddress != null ? deliveryAddress!.name : null,
      errorText: deliveryAddressErrorText,
    );
  }
}

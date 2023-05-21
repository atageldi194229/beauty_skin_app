import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/data/models/delivery_address_model.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:beauty_skin/presentations/common_blocs/profile/profile_bloc.dart';
import 'package:beauty_skin/presentations/widgets/cards/delivery_address_card.dart';
import 'package:beauty_skin/presentations/widgets/others/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/delivery_address_bottom_sheet.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key, this.arguments});

  final DeliveryAddressScreenArguments? arguments;

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProfileBloc>().add(LoadProfile());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Loading();
          }

          if (state is ProfileLoaded) {
            final addressList = state.deliveryAddresses;

            return addressList.isNotEmpty
                ? _buildContect(addressList)
                : Container();
          }

          if (state is ProfileLoadFailure) {
            return Center(child: Text(state.error));
          }

          return const Center(child: Text("Something went wrong"));
        },
      )),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("delivery_address".tr(context)),
      actions: [
        IconButton(
          onPressed: () => _openDeliveryBottomSheet(context),
          icon: const Icon(Icons.add_outlined),
        ),
      ],
    );
  }

  _openDeliveryBottomSheet(
    BuildContext context, {
    DeliveryAddressModel? deliveryAddress,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return DeliveryAddressModelBottomSheet(
          deliveryAddress: deliveryAddress,
        );
      },
    );
  }

  Widget _buildContect(List<DeliveryAddressModel> addressList) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: kdefaultPadding),
      physics: const BouncingScrollPhysics(),
      itemCount: addressList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: kdefaultPadding),
          child: DeliveryAddressCard(
            deliveryAddress: addressList[index],
            onEditPressed: () => _openDeliveryBottomSheet(
              context,
              deliveryAddress: addressList[index],
            ),
            onTap: () {
              final arguments = widget.arguments;

              if (arguments != null && arguments.onSelect != null) {
                arguments.onSelect?.call(addressList[index]);
                Navigator.of(context).pop();
              }
            },
          ),
        );
      },
    );
  }
}

class DeliveryAddressScreenArguments {
  final void Function(DeliveryAddressModel deliveryAddress)? onSelect;
  DeliveryAddressScreenArguments({this.onSelect});
}

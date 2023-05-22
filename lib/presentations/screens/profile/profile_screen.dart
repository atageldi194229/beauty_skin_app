import 'package:beauty_skin/configs/config.dart';
import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/presentations/common_blocs/language/language_bloc.dart';
import 'package:beauty_skin/presentations/common_blocs/profile/profile_bloc.dart';
import 'package:beauty_skin/presentations/widgets/form/tappable_form_field.dart';
import 'package:beauty_skin/presentations/widgets/form/text_field_phone_number.dart';
import 'package:beauty_skin/presentations/widgets/form/text_field_username.dart';
import 'package:beauty_skin/utils/language.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final profileState = context.read<ProfileBloc>().state;

      if (profileState is ProfileLoaded) {
        phoneController.text = profileState.phoneNumber ?? "";
        usernameController.text = profileState.username ?? "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("profile".tr(context))),
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

          // language select
          _buildLanguageDropdown(context),
          const SizedBox(height: kdefaultPadding * 4),

          // delivery_addresses
          TappableFormField(
            onTap: () {
              AppRouter()
                  .navigatorKey
                  .currentState
                  ?.pushNamed(AppRouter.DELIVERY_ADDRESS);
            },
            labelText: "delivery_addresses".tr(context),
            prefixIcon: const Icon(IconlyBold.location),
          ),
          const SizedBox(height: kdefaultPadding * 4),

          // order_history
          TappableFormField(
            onTap: () {},
            labelText: "order_history".tr(context),
            prefixIcon: const Icon(Icons.history),
          ),
          const SizedBox(height: kdefaultPadding * 4),

          // about_us
          TappableFormField(
            onTap: () {
              AppRouter()
                  .navigatorKey
                  .currentState
                  ?.pushNamed(AppRouter.ABOUT_US);
            },
            labelText: "about_us".tr(context),
            prefixIcon: const Icon(Icons.info_outline),
          ),

          // save button
          const SizedBox(height: kdefaultPadding * 4),
          _buildSaveButton(),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: kdefaultPadding * 2,
          horizontal: kdefaultPadding * 4,
        ),
        backgroundColor: COLOR_CONST.primaryColor,
      ),
      onPressed: () {
        context
            .read<ProfileBloc>()
            .add(ProfileUpdated(phoneController.text, usernameController.text));
      },
      child: Text("save".tr(context)),
    );
  }

  Widget _buildLanguageDropdown(BuildContext context) {
    return DropdownButtonFormField(
      isDense: true,
      value: Translate.of(context).locale,
      focusColor: Colors.transparent,
      decoration: InputDecoration(
        labelText: "language".tr(context),
        prefixIcon: const Icon(Icons.language_outlined),
      ),
      items: AppLanguage.supportLanguage.map<DropdownMenuItem<Locale>>((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(UtilLanguage.getLanguageName(e.languageCode)),
        );
      }).toList(),
      onChanged: (selectedLanguage) {
        if (selectedLanguage == null) return;

        BlocProvider.of<LanguageBloc>(context)
            .add(LanguageChanged(selectedLanguage));
      },
    );
  }
}

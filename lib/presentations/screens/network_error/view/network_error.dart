import 'package:beauty_skin/constants/constants.dart';
import 'package:beauty_skin/localization/translate.dart';
import 'package:flutter/material.dart';

/// {@template network_error}
/// A network error alert.
/// {@endtemplate}
class NetworkError extends StatelessWidget {
  /// {@macro network_error}
  const NetworkError({super.key, this.onRetry});

  /// An optional callback which is invoked when the retry button is pressed.
  final VoidCallback? onRetry;

  /// Route constructor to display the widget inside a [Scaffold].
  static Route<void> route({VoidCallback? onRetry}) {
    return PageRouteBuilder<void>(
      pageBuilder: (_, __, ___) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: NetworkError(onRetry: onRetry),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: kDefaultPadding * 3),
        const Icon(
          Icons.error_outline,
          size: 80,
          color: Colors.black87,
        ),
        const SizedBox(height: kDefaultPadding * 2),
        Text(
          "network_error".tr(context),
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: kDefaultPadding * 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 8),
          child: ElevatedButton(
            onPressed: onRetry,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 0,
                  child: Icon(Icons.refresh, size: kDefaultPadding * 2),
                ),
                SizedBox(width: kDefaultPadding * .5),
                Flexible(
                  child: Text(
                    "network_error_button",
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: kDefaultPadding * 3),
      ],
    );
  }
}

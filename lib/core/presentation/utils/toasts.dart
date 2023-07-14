import 'package:flutter/material.dart';
import '../services/connection_stream_service.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_toast.dart';

abstract class Toasts {
  static void showTitledToast(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    CustomToast.showToast(
      context,
      positionedToastBuilder: (context, child) {
        return Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: child,
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomText.f16(
            context,
            title,
            weight: FontStyles.fontWeightSemiBold,
          ),
          const SizedBox(
            height: Sizes.marginV2,
          ),
          CustomText.f14(
            context,
            description,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.marginH20,
      ),
    );
  }

  static void showConnectionToast(
    BuildContext context, {
    required ConnectionStatus connectionStatus,
  }) {
    CustomToast.showToast(
      context,
      child: Row(
        children: <Widget>[
          if (connectionStatus == ConnectionStatus.disconnected)
            const Icon(
              Icons.wifi_off,
              size: Sizes.icon24,
            )
          else
            const Icon(
              Icons.wifi,
              size: Sizes.icon24,
            ),
          const SizedBox(
            width: Sizes.marginH12,
          ),
          CustomText.f16(
            context,
            connectionStatus == ConnectionStatus.disconnected
                ? 'youAreCurrentlyOffline'
                : 'youAreBackOnline',
            weight: FontStyles.fontWeightSemiBold,
          ),
        ],
      ),
    );
  }

  static Future<void> showBackgroundMessageToast(
    BuildContext context, {
    required String message,
  }) async {
    await CustomToast.showBackgroundToast(
      context,
      msg: message,
    );
  }
}

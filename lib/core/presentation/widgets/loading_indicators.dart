import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'platform_widgets/platform_circluar_progress_indicator.dart';

import '../../../gen/my_assets.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import 'custom_text.dart';


abstract class LoadingIndicators {
  static Widget defaultLoadingIndicator(
    BuildContext context, {
    String? message,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV28,
        horizontal: Sizes.dialogPaddingH20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const PlatformCircularProgressIndicator(
            color: Color(0xFF5286d3),
            materialData: MaterialProgressIndicatorData(
              strokeWidth: 3,
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFF5286d3),
              ),
            ),
            cupertinoData: CupertinoActivityIndicatorData(
              radius: 20,
            ),
          ),
          if (message != null) ...[
            const SizedBox(
              height: Sizes.marginV20,
            ),
            CustomText.f16(
              context,
              message,
              weight: FontStyles.fontWeightSemiBold,
              textAlign: TextAlign.center,
            ),
          ]
        ],
      ),
    );
  }
}

class SmallLoadingAnimation extends StatelessWidget {
  const SmallLoadingAnimation({
    this.height = Sizes.loadingIndicatorR150,
    this.width = Sizes.loadingIndicatorR150,
    super.key,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColoredBox(
        color: Colors.transparent,
        child: Lottie.asset(
          MyAssets.ASSETS_IMAGES_CORE_LOADING_ANIMATION_JSON,
          height: height,
          width: width,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import 'custom_text.dart';
import 'platform_widgets/platform_elevated_button.dart';

//Composition works better than inheritance: https://groups.google.com/g/flutter-dev/c/muVUV4z71fs/m/DS0twymQCAAJ
class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.onPressed,
    this.height,
    this.width,
    this.minHeight,
    this.minWidth,
    this.child,
    this.text,
    this.shape,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.gradientColor,
    this.gradientBorderRadius,
    this.padding,
    this.onLongPress,
    super.key,
  }) : assert(
          text != null || child != null,
          "Either text or child shouldn't be null",
        );
  final double? height;
  final double? width;
  final double? minHeight;
  final double? minWidth;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final double? elevation;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final Gradient? gradientColor;
  final BorderRadiusGeometry? gradientBorderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      onPressed: onPressed,
      materialData: MaterialElevatedButtonData(
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.buttonR24),
              ),
          elevation: elevation ?? 0,
          backgroundColor: buttonColor,
          foregroundColor: splashColor,
          shadowColor: shadowColor,
          minimumSize: Size(
            minWidth ?? Sizes.buttonWidth60,
            minHeight ?? Sizes.buttonHeight40,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      cupertinoData: CupertinoElevatedButtonData(
        color: buttonColor,
        padding: padding ?? EdgeInsets.zero,
        borderRadius: shape != null
            ? (shape! as RoundedRectangleBorder)
                .borderRadius
                .resolve(Directionality.maybeOf(context))
            : BorderRadius.circular(Sizes.buttonR24),
        minSize: minHeight ?? Sizes.buttonHeight40,
      ),
      child: Container(
        alignment: Alignment.center,
        height: height ?? Sizes.buttonHeight48,
        width: width ?? Sizes.buttonWidth220,
        decoration: buttonColor == null
            ? BoxDecoration(
                borderRadius: gradientBorderRadius ??
                    BorderRadius.circular(Sizes.buttonR24),
                gradient: const LinearGradient(
                  colors: [Color(0xFFd74747), Color(0xFFC11718)],
                  stops: [0, 1],
                ),
              )
            : null,
        child: child ??
            CustomText.f16(
              context,
              text!,
              color: buttonColor == null ? const Color(0xffffffff) : null,
              weight: FontStyles.fontWeightSemiBold,
            ),
      ),
    );
  }
}

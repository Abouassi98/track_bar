import 'package:flutter/material.dart';

abstract class NavigationService {
  static void removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static Future<void> popDialog<T extends Object?>(
    BuildContext context, {
    T? result,
  }) async {
    final navigator = Navigator.of(context, rootNavigator: true);
    if (navigator.canPop()) {
      return navigator.pop(result);
    }
  }
}

part of '../providers/provider_utils.dart';

extension AutoDisposeRefExtension<T> on AutoDisposeRef<T> {
  /// When invoked keeps your provider alive for [duration]
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);
    onDispose(timer.cancel);
  }

  /// Keep listening to an autoDispose provider until last listener is removed.
  ///
  /// This is primarily used to initialize and preserve the state of the provider
  /// when navigating to a route until that route is popped off.
  ///
  /// see: https://github.com/rrousselGit/riverpod/issues/1329
  void keepAliveUntilNoListeners() {
    keepAlive();
    onCancel(invalidateSelf);
  }
}

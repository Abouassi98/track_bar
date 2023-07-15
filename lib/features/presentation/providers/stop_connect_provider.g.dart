// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop_connect_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stopConnectStateHash() => r'a6cdc6e3c636f6dfc68a93782120efd5df476ec5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef StopConnectStateRef = AutoDisposeFutureProviderRef<ConnectionStatus>;

/// See also [stopConnectState].
@ProviderFor(stopConnectState)
const stopConnectStateProvider = StopConnectStateFamily();

/// See also [stopConnectState].
class StopConnectStateFamily extends Family<AsyncValue<ConnectionStatus>> {
  /// See also [stopConnectState].
  const StopConnectStateFamily();

  /// See also [stopConnectState].
  StopConnectStateProvider call(
    BuildContext context,
  ) {
    return StopConnectStateProvider(
      context,
    );
  }

  @override
  StopConnectStateProvider getProviderOverride(
    covariant StopConnectStateProvider provider,
  ) {
    return call(
      provider.context,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'stopConnectStateProvider';
}

/// See also [stopConnectState].
class StopConnectStateProvider
    extends AutoDisposeFutureProvider<ConnectionStatus> {
  /// See also [stopConnectState].
  StopConnectStateProvider(
    this.context,
  ) : super.internal(
          (ref) => stopConnectState(
            ref,
            context,
          ),
          from: stopConnectStateProvider,
          name: r'stopConnectStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopConnectStateHash,
          dependencies: StopConnectStateFamily._dependencies,
          allTransitiveDependencies:
              StopConnectStateFamily._allTransitiveDependencies,
        );

  final BuildContext context;

  @override
  bool operator ==(Object other) {
    return other is StopConnectStateProvider && other.context == context;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, context.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$stopConnectHash() => r'a558e159322dad7263e7d8ab401a49d785402044';
typedef StopConnectRef = AutoDisposeFutureProviderRef<void>;

/// See also [stopConnect].
@ProviderFor(stopConnect)
const stopConnectProvider = StopConnectFamily();

/// See also [stopConnect].
class StopConnectFamily extends Family<AsyncValue<void>> {
  /// See also [stopConnect].
  const StopConnectFamily();

  /// See also [stopConnect].
  StopConnectProvider call(
    Event<Unit> event,
  ) {
    return StopConnectProvider(
      event,
    );
  }

  @override
  StopConnectProvider getProviderOverride(
    covariant StopConnectProvider provider,
  ) {
    return call(
      provider.event,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'stopConnectProvider';
}

/// See also [stopConnect].
class StopConnectProvider extends AutoDisposeFutureProvider<void> {
  /// See also [stopConnect].
  StopConnectProvider(
    this.event,
  ) : super.internal(
          (ref) => stopConnect(
            ref,
            event,
          ),
          from: stopConnectProvider,
          name: r'stopConnectProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$stopConnectHash,
          dependencies: StopConnectFamily._dependencies,
          allTransitiveDependencies:
              StopConnectFamily._allTransitiveDependencies,
        );

  final Event<Unit> event;

  @override
  bool operator ==(Object other) {
    return other is StopConnectProvider && other.event == event;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$stopConnectEventHash() => r'e1ccff284867c93a6131770c85784ac7575cf756';

/// See also [StopConnectEvent].
@ProviderFor(StopConnectEvent)
final stopConnectEventProvider =
    AutoDisposeNotifierProvider<StopConnectEvent, Option<Event<Unit>>>.internal(
  StopConnectEvent.new,
  name: r'stopConnectEventProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stopConnectEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StopConnectEvent = AutoDisposeNotifier<Option<Event<Unit>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

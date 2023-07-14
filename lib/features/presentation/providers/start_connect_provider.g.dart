// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_connect_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$startConnectStateHash() => r'773f78a6c7929406ce0c533babd145dda19e8bee';

/// See also [startConnectState].
@ProviderFor(startConnectState)
final startConnectStateProvider =
    AutoDisposeFutureProvider<ConnectionStatus>.internal(
  startConnectState,
  name: r'startConnectStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$startConnectStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StartConnectStateRef = AutoDisposeFutureProviderRef<ConnectionStatus>;
String _$startSensorHash() => r'df7d9977335f3027cd8cb1089de8ca6063b4da61';

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

typedef StartSensorRef = AutoDisposeFutureProviderRef<void>;

/// See also [startSensor].
@ProviderFor(startSensor)
const startSensorProvider = StartSensorFamily();

/// See also [startSensor].
class StartSensorFamily extends Family<AsyncValue<void>> {
  /// See also [startSensor].
  const StartSensorFamily();

  /// See also [startSensor].
  StartSensorProvider call(
    Event<Unit> event,
  ) {
    return StartSensorProvider(
      event,
    );
  }

  @override
  StartSensorProvider getProviderOverride(
    covariant StartSensorProvider provider,
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
  String? get name => r'startSensorProvider';
}

/// See also [startSensor].
class StartSensorProvider extends AutoDisposeFutureProvider<void> {
  /// See also [startSensor].
  StartSensorProvider(
    this.event,
  ) : super.internal(
          (ref) => startSensor(
            ref,
            event,
          ),
          from: startSensorProvider,
          name: r'startSensorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$startSensorHash,
          dependencies: StartSensorFamily._dependencies,
          allTransitiveDependencies:
              StartSensorFamily._allTransitiveDependencies,
        );

  final Event<Unit> event;

  @override
  bool operator ==(Object other) {
    return other is StartSensorProvider && other.event == event;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, event.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$startSensorEventHash() => r'22d06747dc17d4e5960faedb81505fb16723e411';

/// See also [StartSensorEvent].
@ProviderFor(StartSensorEvent)
final startSensorEventProvider =
    AutoDisposeNotifierProvider<StartSensorEvent, Option<Event<Unit>>>.internal(
  StartSensorEvent.new,
  name: r'startSensorEventProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$startSensorEventHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StartSensorEvent = AutoDisposeNotifier<Option<Event<Unit>>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions

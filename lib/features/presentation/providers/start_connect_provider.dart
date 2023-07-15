import 'package:flutter/material.dart';

import '../../../core/presentation/providers/provider_utils.dart';
import '../../../core/presentation/services/connection_stream_service.dart';
import '../../../core/presentation/utils/event.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../../core/presentation/utils/toasts.dart';
import '../../domain/use_case/start_sensor_uc.dart';
import 'connection_state_provider.dart';

part 'start_connect_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
FutureOr<ConnectionStatus> startConnectState(
  StartConnectStateRef ref,
  BuildContext context,
) {
  final sub = ref.listen(connectStateProvider.notifier, (prev, next) {});
  ref.listenSelf((previous, next) {
    next.whenData(
      (user) {
        if (user == ConnectionStatus.connected) {
          sub.read().startConnect();
          Toasts.showConnectionToast(
            context,
            connectionStatus: ConnectionStatus.connected,
          );
        }
      },
    );
  });

  final event = ref.watch(startSensorEventProvider);

  return event.match(
    () => ConnectionStatus.disconnected,
    (event) {
      return ref
          .watch(startSensorProvider(event).future)
          .then((value) => ConnectionStatus.connected);
    },
  );
}

@riverpod
class StartSensorEvent extends _$StartSensorEvent with NotifierUpdate {
  @override
  Option<Event<Unit>> build() => const None();
}

@riverpod
FutureOr<void> startSensor(
  StartSensorRef ref,
  Event<Unit> event,
) async {
  ref.watch(startSensorUCProvider).call();
}

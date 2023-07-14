import '../../../core/presentation/providers/provider_utils.dart';
import '../../../core/presentation/services/connection_stream_service.dart';
import '../../../core/presentation/utils/event.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/use_case/stop_sensor_uc.dart';
import 'connection_state_provider.dart';
part 'stop_connect_provider.g.dart';

@riverpod
FutureOr<ConnectionStatus> stopConnectState(StopConnectStateRef ref) {
  final sub = ref.listen(connectStateProvider.notifier, (prev, next) {});
  ref.listenSelf((previous, next) {
    next.whenData(
      (state) {
        if (state == ConnectionStatus.disconnected) {
          sub.read().stopConnect();
        }
      },
    );
  });

  final event = ref.watch(stopConnectEventProvider);
  return event.match(
    () => ConnectionStatus.connected,
    (event) {
      return ref
          .watch(stopConnectProvider(event).future)
          .then((_) => ConnectionStatus.disconnected);
    },
  );
}

@riverpod
class StopConnectEvent extends _$StopConnectEvent with NotifierUpdate {
  @override
  Option<Event<Unit>> build() => const None();
}

@riverpod
FutureOr<void> stopConnect(
  StopConnectRef ref,
  Event<Unit> event,
) async {
  ref.watch(stopSensorUCProvider).call();
}

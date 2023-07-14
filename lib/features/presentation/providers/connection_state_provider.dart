
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/presentation/services/connection_stream_service.dart';
import '../../../core/presentation/utils/fp_framework.dart';
part 'connection_state_provider.g.dart';

@Riverpod(keepAlive: true)
class ConnectState extends _$ConnectState {
  @override
  Option<ConnectionStatus> build() => const None();

  void startConnect() {
    state = const Some(ConnectionStatus.connected);
  }

  void stopConnect() {
    state = const None();
  }
}

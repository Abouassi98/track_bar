import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../../../core/presentation/services/connection_stream_service.dart';
import '../../../core/presentation/utils/event.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../../core/presentation/widgets/custom_text.dart';
import '../../../core/presentation/widgets/loading_indicators.dart';
import '../../domain/entity/sensor.dart';
import '../components/retry_again_component.dart';
import '../providers/get_data_provider.dart';
import '../providers/start_connect_provider.dart';
import '../providers/stop_connect_provider.dart';
import '../widgets/custom_sensor_widget.dart';

class TrackbarApp extends HookConsumerWidget {
  const TrackbarApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(setupConnectionProvider, (prevState, newState) {});
    //ref.listen(connectStateProvider, (prevState, newState) {});
    ref.easyListen(startConnectStateProvider);
    ref.easyListen(stopConnectStateProvider);
    final connectionDataAsync = ref.watch(getDataProvider);
    void startSensor() => ref
        .read(startSensorEventProvider.notifier)
        .update((_) => Some(Event.unique(unit)));
    void stopSensor() => ref
        .read(stopConnectEventProvider.notifier)
        .update((_) => Some(Event.unique(unit)));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trackbar App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            connectionDataAsync.when(
              skipLoadingOnReload: true,
              skipLoadingOnRefresh: !connectionDataAsync.hasError,
              loading: () => LoadingIndicators.defaultLoadingIndicator(
                context,
                message: 'connecting...',
              ),
              error: (error, st) => RetryAgainComponent(
                description: error.toString(),
                onPressed: () {
                  ref.invalidate(startSensorProvider);
                },
              ),
              data: (data) => Column(
                children: [
                  CustomSensorWidget(sensor: RadarSensor(data: data)),
                  CustomSensorWidget(sensor: MagneticFieldSensor(data: data)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed:
                  ref.isLoading(startConnectStateProvider) ? null : startSensor,
              child: CustomText.f14(context, 'Start Sensor'),
            ),
            ElevatedButton(
              onPressed:
                  ref.isLoading(stopConnectStateProvider) ? null : stopSensor,
              child: CustomText.f14(context, 'Stop Sensor'),
            ),
            StreamBuilder<List<ScanResult>>(
              stream: FlutterBluePlus.instance.scanResults,
              initialData: const [],
              builder: (c, snapshot) {
                return Column(
                  children: snapshot.data!
                      .map(
                        (r) => InkWell(
                          onTap: () {
                            r.device.connect();
                          },
                          child: CustomText.f16(
                            context,
                            r.advertisementData.localName,
                            color: Colors.black,
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBluePlus.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              onPressed: () => FlutterBluePlus.instance.stopScan(),
              backgroundColor: Colors.red,
              child: const Icon(Icons.stop),
            );
          } else {
            return FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () => FlutterBluePlus.instance
                  .startScan(timeout: const Duration(seconds: 60))
                  .then(
                    (value) => debugPrint('efeffe=$value'),
                  ),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/presentation/services/connection_stream_service.dart';
import '../../../core/presentation/utils/event.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../../core/presentation/widgets/custom_text.dart';
import '../../../core/presentation/widgets/loading_indicators.dart';
import '../../domain/entity/sensor.dart';
import '../components/retry_again_component.dart';
import '../providers/bluetooth_provider.dart';
import '../providers/get_data_provider.dart';
import '../providers/start_connect_provider.dart';
import '../providers/stop_connect_provider.dart';
import '../widgets/custom_sensor_widget.dart';

class TrackbarApp extends HookConsumerWidget {
  const TrackbarApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
//////////////////////////////////////////////////////////////////////////

    final bluetoothDevicesAsync = ref.watch(bluetoothDevicesProvider);
    ref.listen(setupConnectionProvider, (prevState, newState) {});
    ref.easyListen(startConnectStateProvider(context));
    ref.easyListen(stopConnectStateProvider(context));
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
            // bluetoothDevicesAsync.when(
            //   skipLoadingOnReload: true,
            //   skipLoadingOnRefresh: !bluetoothDevicesAsync.hasError,
            //   loading: () => LoadingIndicators.defaultLoadingIndicator(
            //     context,
            //     message: 'connecting...',
            //   ),
            //   error: (error, st) => RetryAgainComponent(
            //     description: error.toString(),
            //     onPressed: () {
            //       ref.invalidate(bluetoothDevicesProvider);
            //     },
            //   ),
            //   data: (data) => Flexible(
            //     fit: FlexFit.tight,
            //     child: ListView.builder(
            //       itemCount: data.length,
            //       itemBuilder: (context, index) => InkWell(
            //         onTap: () async {
            //           await BlueThermalPrinter.instance.isConnected
            //               .then((isConnected) async {
            //             if (!isConnected!) {
            //               try {
            //                 await BlueThermalPrinter.instance.connect(
            //                   BluetoothDevice(
            //                     data[index].name,
            //                     data[index].address,
            //                   ),
            //                 );
            //               } on PlatformException {
            //                 await Toasts.showBackgroundMessageToast(
            //                   context,
            //                   message:
            //                       'Failed to connect bluetooth. Try to restart the device',
            //                 );
            //               }
            //             }
            //           });
            //         },
            //         child: Padding(
            //           padding: const EdgeInsets.all(8),
            //           child: Card(child: Text(data[index].name ?? '')),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
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
              onPressed: ref.isLoading(startConnectStateProvider(context))
                  ? null
                  : startSensor,
              child: CustomText.f14(context, 'Start Sensor'),
            ),
            ElevatedButton(
              onPressed: ref.isLoading(stopConnectStateProvider(context))
                  ? null
                  : stopSensor,
              child: CustomText.f14(context, 'Stop Sensor'),
            ),
          ],
        ),
      ),
    );
  }
}

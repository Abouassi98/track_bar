import 'package:flutter/material.dart';
import '../../../core/presentation/widgets/custom_text.dart';
import '../../domain/entity/sensor.dart';

class CustomSensorWidget extends StatelessWidget {
  const CustomSensorWidget({required this.sensor, super.key});
  final ISensor sensor;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          CustomText.f20(
            context,
            'Type Sensor : ${sensor.type.name}',
          ),
          const SizedBox(
            height: 8,
          ),
          CustomText.f16(
            context,
            'x = ${sensor.data.x} \t y = ${sensor.data.y} \t z = ${sensor.data.z}',
          ),
        ],
      ),
    );
  }
}

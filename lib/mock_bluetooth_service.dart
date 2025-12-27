import 'dart:async';
import 'dart:math';

import 'package:tsyp_app/vitalSample.dart';


class MockBluetoothService {
  final _controller = StreamController<VitalSample>();
  final Random _random = Random();
  Timer? _timer;

  Stream<VitalSample> get stream => _controller.stream;

  void start() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final sample = VitalSample(
        timestamp: DateTime.now(),
        heartrate: 60 + _random.nextInt(40),        // 60–100 BPM
        temperature: 36 + _random.nextDouble() * 1.5, // 36–37.5 °C
        humidity: 30 + _random.nextInt(20),         // 30–50 %
      );

      _controller.add(sample);
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    stop();
    _controller.close();
  }
}

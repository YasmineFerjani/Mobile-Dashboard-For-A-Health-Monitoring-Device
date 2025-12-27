import 'package:flutter/material.dart';

class PersonalWidget extends StatefulWidget {
  const PersonalWidget({super.key});

  @override
  State<PersonalWidget> createState() => _PersonalWidgetState();
}

class _PersonalWidgetState extends State<PersonalWidget> {
  int minHeartValue = 60;
  int maxHeartValue = 100;
  double tempValue = 41.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {}, // does nothing
        child: const Icon(Icons.create_rounded),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Device', style: Theme.of(context).textTheme.titleLarge),
            Text('Device Name', style: Theme.of(context).textTheme.titleMedium),
            Text('My Watch', style: Theme.of(context).textTheme.bodyMedium),

            const SizedBox(height: 20),

            Text('Set Your Thresholds',
                style: Theme.of(context).textTheme.titleLarge),

            // Min HR
            Text('Min Heart Rate',
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Slider(
                    value: minHeartValue.toDouble(),
                    min: 20,
                    max: 70,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() => minHeartValue = value.toInt());
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    minHeartValue.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            // Max HR
            Text('Max Heart Rate',
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Slider(
                    value: maxHeartValue.toDouble(),
                    min: 80,
                    max: 200,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() => maxHeartValue = value.toInt());
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    maxHeartValue.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            // Temperature
            Text('Temperature Threshold',
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: Slider(
                    value: tempValue,
                    min: 30,
                    max: 45,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() => tempValue = value);
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    tempValue.toStringAsFixed(1),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

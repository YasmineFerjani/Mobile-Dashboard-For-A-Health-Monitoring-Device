import 'package:flutter/material.dart';
import 'package:tsyp_app/MockData.dart';
import 'package:tsyp_app/graphComp.dart';
import 'package:tsyp_app/vitalSample.dart';

class GraphWidget extends StatelessWidget {
  final List<VitalSample> sample; 
  const GraphWidget(this.sample, {super.key});

  @override
  Widget build(BuildContext context) {
    final heartrateValues = sample.map((e) => e.heartrate.toDouble()).toList(); 
    final timeValues = sample.map((e) => e.timestamp).toList(); 
    final temperatureValues = sample.map((e) => e.temperature).toList(); 
    final humidityValues = sample.map((e) => e.humidity.toDouble()).toList(); 
    return Container(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    
                    children: [
                        Text('Tracking', style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.right,),
                        Text('24-hour vital sign tracking', style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.right,),
                    ],
                  ), 
                  Icon(Icons.healing, color: Colors.blue, size: 45,)
                ],
              ),
              GraphCompWidget("Heart Tracking", "Bpm",timeValues,heartrateValues , [Colors.cyan, Colors.blue]),
              GraphCompWidget("Temperature Tracking", "°C", timeValues, temperatureValues, [const Color.fromARGB(255, 102, 197, 105), Colors.green]),
              GraphCompWidget("Humidity Tracking", "%", timeValues, humidityValues, [const Color.fromARGB(255, 218, 157, 67), Colors.orange]),
            ],
          )
        ],
      )
      )
    );
  }
}
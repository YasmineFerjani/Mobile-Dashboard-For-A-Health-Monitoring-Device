import 'package:flutter/material.dart';
import 'package:tsyp_app/tipComp.dart';

class TipsWidget extends StatelessWidget {
  const TipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Wrap(
            clipBehavior: Clip.antiAlias,
            children: [
                
                TipCompWidget(
                  Icons.tips_and_updates, Colors.blue,
                  "Maintain Healthy Heart Rate",
                  "Regular exercise helps maintain a healthy resting heart rate. Aim for 150 minutes of moderate activity per week."),

                TipCompWidget(
                  Icons.device_thermostat_outlined, Colors.green, 
                  "Monitor Body Temperature",
                  "Normal body temperature ranges from 36.1C to 37.2°C. Slight variations are normal throughout the day."), 
                  ],
          )
          
        ],
      ),
      )
    );
  }
}
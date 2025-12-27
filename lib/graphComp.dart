import 'package:flutter/material.dart';
import 'package:tsyp_app/MockData.dart';
import 'package:tsyp_app/lineChart.dart';

class GraphCompWidget extends StatelessWidget {
  String title; 
  String unit; 
  List<double> samples_y;
  List<DateTime> samples_x;
  List<Color> color;
  GraphCompWidget(this.title, this.unit, this.samples_x,this.samples_y, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(

      margin: EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),  

      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(title, style:Theme.of(context).textTheme.titleMedium,), 
              Text(unit, style: Theme.of(context).textTheme.bodyLarge), 
              ],),
          LineChartWidget(samples_x,samples_y, color)
        ],
      ) 
    )
    );
  }
}
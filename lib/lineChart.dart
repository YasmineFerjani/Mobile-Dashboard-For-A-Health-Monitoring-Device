import 'dart:math';


import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tsyp_app/MockData.dart';
import 'package:tsyp_app/vitalSample.dart';

class LineChartWidget extends StatefulWidget {
  final List<double> samples_y; 
  final List<DateTime> samples_x; 
  final windowSize = 60;
  List<Color> color;
  LineChartWidget(this.samples_x,this.samples_y,  this.color, {super.key});
  

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {

  
  @override
  Widget build(BuildContext context) { 
    final total = widget.samples_x.length; 
    final startIndex = total > widget.windowSize ? total - widget.windowSize : 0; 

    final visibleY = widget.samples_y.sublist(startIndex); 
    final visibleX   = widget.samples_x.sublist(startIndex); 
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.5,



          child: Padding(
            
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),

            child: LineChart(
              mainData(visibleX, visibleY),
            ),
          ),


        ),

      ],
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(

      fontSize: 12,
      color: Colors.white
    );
    String text = value.toString();

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta, visibleX) {
    final index = value.toInt();

    if (index < 0 || index >= visibleX.length) {
      return const SizedBox.shrink();
    }

    final time = visibleX[index];

    final label =
        "${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";

    return SideTitleWidget(
      meta: meta,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }




    LineChartData mainData(visibleX,visibleY) { 

      
    return LineChartData(
      backgroundColor: Theme.of(context).primaryColor,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        verticalInterval: 60,
        drawHorizontalLine: false,


        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.grey,
            strokeWidth: 1,
          );
        },


        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color.fromARGB(255, 158, 152, 152) ,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 30,
            getTitlesWidget: (value, meta) => bottomTitleWidgets(value, meta, visibleX),
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 20,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 50,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: (visibleY.length -1).toDouble(),
      minY: widget.samples_y.reduce(min) -5,
      maxY: widget.samples_y.reduce(max) +5,
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(visibleY.length, (i) {
                return FlSpot(
                  i.toDouble(),
                  visibleY[i],
                );
              }),
          isCurved: true,
          gradient: LinearGradient(
            colors: widget.color,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: widget.color
                  .map((color) => color.withValues(alpha: 0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  

  

}

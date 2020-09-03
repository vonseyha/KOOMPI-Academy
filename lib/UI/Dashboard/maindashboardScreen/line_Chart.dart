import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class LinearReportChart extends StatelessWidget {
  final Color iconcolor;
  LinearReportChart({this.iconcolor});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AspectRatio(
            aspectRatio: 2.2,
            child: LineChart(
              LineChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: getSports(),
                      isCurved: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                      colors: [iconcolor],
                      barWidth: 4,
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}

List<FlSpot> getSports() {
  return [
    FlSpot(0, .5),
    FlSpot(1, 1.5),
    FlSpot(2, .5),
    FlSpot(3, .7),
    FlSpot(4, .2),
    FlSpot(5, 2),
    FlSpot(6, 1.5),
    FlSpot(7, 1.7),
    FlSpot(8, 1),
    FlSpot(9, 2.8),
    FlSpot(10, 2.5),
    FlSpot(11, 2.65),
  ];
}



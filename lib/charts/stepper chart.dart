import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartStepperView extends StatefulWidget {
  const ChartStepperView({Key? key}) : super(key: key);

  @override
  State<ChartStepperView> createState() => _ChartStepperViewState();
}

class _ChartStepperViewState extends State<ChartStepperView> {
  List<_SalesData> data = [
    _SalesData('Jan', 5),
    _SalesData('Feb', 35),
    _SalesData('Mar', 10),
    _SalesData('Apr', 45),
    _SalesData('May', 02),
    _SalesData('Jun', 12),
    _SalesData('July', 40),
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBackgroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      borderColor: Colors.transparent,
      primaryXAxis: CategoryAxis(),
      series: <ChartSeries>[
        // Renders step line chart
        StepLineSeries<_SalesData, String>(
          // color: Colors.transparent,
          dataSource: data,
          xValueMapper: (_SalesData data, _) => data.year,
          yValueMapper: (_SalesData data, _) => data.sales,
        )
      ],
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

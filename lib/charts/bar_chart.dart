import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartBar extends StatefulWidget {
  final String text;
  const ChartBar({Key? key, required this.text}) : super(key: key);

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('Mon', 12),
      _ChartData('Tue', 15),
      _ChartData('Wed', 20),
      _ChartData('Thu', 6.4),
      _ChartData('Fri', 14),
      _ChartData('Sat', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        isTransposed: true,
        title: ChartTitle(
            text: widget.text,
            alignment: ChartAlignment.near,
            textStyle:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.w300)),
        primaryYAxis: NumericAxis(minimum: 0, maximum: 24, interval: 10),
        tooltipBehavior: _tooltip,
        backgroundColor: Colors.transparent,
        series: <ChartSeries<_ChartData, String>>[
          BarSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Gold',
              color: Color.fromRGBO(8, 142, 255, 1))
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

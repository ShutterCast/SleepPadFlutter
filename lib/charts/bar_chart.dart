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
    data = [_ChartData('Mon', 12), _ChartData('Tue', 15), _ChartData('Wed', 20), _ChartData('Thu', 6.4), _ChartData('Fri', 14), _ChartData('Sat', 14)];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: const AxisLine(width: 0),
        ),
        isTransposed: true,
        title: ChartTitle(
          text: widget.text,
          alignment: ChartAlignment.near,
          textStyle: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w300,
          ),
        ),
        primaryYAxis: NumericAxis(
          isVisible: false,
          minimum: 0,
          maximum: 24,
          interval: 10,
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: const AxisLine(width: 0),
        ),
        borderWidth: 0,
        borderColor: Colors.transparent,
        tooltipBehavior: _tooltip,
        backgroundColor: Colors.transparent,
        series: <ChartSeries<_ChartData, String>>[
          BarSeries<_ChartData, String>(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            name: '',
            color: Colors.blue,
          )
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

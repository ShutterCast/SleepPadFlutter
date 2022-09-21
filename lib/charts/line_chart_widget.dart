import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChartWidget extends StatefulWidget {
  final String text;
  const LineChartWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData("Mon", 15),
      ChartData("Tue", 28),
      ChartData("Wed", 34),
      ChartData("Thu", 20),
      ChartData("Fri", 40),
      ChartData("Sat", 40),
    ];

    return SfCartesianChart(
      title: ChartTitle(
        text: widget.text,
        alignment: ChartAlignment.near,
        textStyle: TextStyle(
          color: Colors.white70,
          fontWeight: FontWeight.w300,
        ),
      ),
      enableAxisAnimation: true,
      primaryXAxis: CategoryAxis(
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: const AxisLine(width: 0),
      ),
      selectionType: SelectionType.point,
      primaryYAxis: NumericAxis(
        isVisible: false,
      ),
      series: <ChartSeries>[
        SplineSeries<ChartData, String>(
          enableTooltip: true,
          width: 1,
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: Colors.blue,
            shape: DataMarkerType.circle,
          ),
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ),
      ],
      backgroundColor: Colors.transparent,
      borderWidth: 0,
      plotAreaBorderWidth: 0,
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

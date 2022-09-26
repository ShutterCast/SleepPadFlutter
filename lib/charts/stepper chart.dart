import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartStepperView extends StatefulWidget {
  const ChartStepperView({Key? key}) : super(key: key);

  @override
  State<ChartStepperView> createState() => _ChartStepperViewState();
}

class _ChartStepperViewState extends State<ChartStepperView> {
  List<_SalesData> data = [
    _SalesData('2:30AM', 45),
    _SalesData('3:30AM', 02),
    _SalesData('4:30AM', 12),
    _SalesData('5:30AM', 55),
    _SalesData('6:30PM', 5),
    _SalesData('7:30PM', 35),
    _SalesData('8:30AM', 10),
    _SalesData('9:30AM', 45),
    _SalesData('10:30AM', 02),
    _SalesData('11:30AM', 55),
    _SalesData('12:30AM', 25),
  ];
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.white,
            Colors.indigoAccent,
            Colors.blue,
            Colors.lightBlueAccent,
            Colors.pinkAccent,
          ],
          stops: [
            0.0,
            0.14,
            0.35,
            0.5,
            0.7,
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        plotAreaBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        borderColor: Colors.transparent,
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: const AxisLine(width: 0),
          interval: 3,
        ),
        primaryYAxis: NumericAxis(
          majorGridLines: const MajorGridLines(width: 0),
          axisLine: const AxisLine(width: 0),
          isVisible: false,
          // axisLabelFormatter: (AxisLabelRenderDetails args) {
          //   String? text;
          //   TextStyle? textStyle;
          //   text == args.text;
          //   if (args.text == '5')
          //     textStyle = args.textStyle.copyWith(fontFamily: 'DancingScript');
          //   if (args.text == '20') {
          //     text = "Light";
          //     textStyle = TextStyle(color: Colors.blueAccent);
          //     // args.textStyle.copyWith(color: Colors.green);
          //   }
          //   if (args.text == '35')
          //     textStyle = args.textStyle.copyWith(fontSize: 15);
          //   if (args.text == '45')
          //     textStyle = args.textStyle.copyWith(fontStyle: FontStyle.italic);
          //
          //   return ChartAxisLabel(args.text, textStyle);
          // },
        ),
        series: <ChartSeries>[
          // Renders step line chart
          StepLineSeries<_SalesData, String>(
            width: 4,
            dataSource: data,
            xValueMapper: (_SalesData data, _) => data.year,
            yValueMapper: (_SalesData data, _) => data.sales,
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

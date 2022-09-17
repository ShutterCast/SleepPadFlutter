import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:sleep_pad/charts/bar_chart.dart';
import 'package:sleep_pad/charts/calender_screen.dart';
import 'package:sleep_pad/charts/line_chart_widget.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<bool> isSelected = [true, false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            tileMode: TileMode.clamp,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF7c5295),
              Color(0xFF271d4d),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: ListView(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MyText(
                text: "DASHBOARD",
                fontWeight: FontWeight.w300,
                fontSize: 24,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Divider(
                color: Colors.white,
                height: 2,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              ToggleButtons(
                isSelected: isSelected,
                selectedColor: Colors.white,
                color: Colors.grey,
                borderColor: Colors.white, selectedBorderColor: Colors.grey,
                borderWidth: 1,
                fillColor: Colors.grey, borderRadius: BorderRadius.circular(5),
                renderBorder: true,
                //splashColor: Colors.red,
                highlightColor: Colors.white,
                // constraints: BoxConstraints(),
                children: const <Widget>[
                  ChartFilterText(
                    title: 'Days',
                  ),
                  ChartFilterText(
                    title: 'Weeks',
                  ),
                  ChartFilterText(
                    title: 'Months',
                  ),
                  ChartFilterText(
                    title: 'All',
                  ),
                ],
                onPressed: (int newIndex) {
                  setState(() {
                    for (int index = 0; index < isSelected.length; index++) {
                      if (index == newIndex) {
                        isSelected[index] = true;
                      } else {
                        isSelected[index] = false;
                      }
                    }
                  });
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Divider(
                color: Colors.white,
                height: 2,
              ),
              const ChartBar(
                text: "Sleep Score - Avg 74",
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Divider(
                color: Colors.white,
                height: 2,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              MyText(
                text: "Heart Rate - Avg 66 BPM",
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.white70,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: DChartLine(
                  data: const [
                    {
                      'id': 'Line',
                      'data': [
                        {'domain': 0, 'measure': 1},
                        {'domain': 1, 'measure': 1.2},
                        {'domain': 2, 'measure': 2},
                        {'domain': 3, 'measure': 3},
                        {'domain': 4, 'measure': 5},
                        {'domain': 5, 'measure': 4.7},
                        {'domain': 6, 'measure': 4},
                      ],
                    },
                  ],
                  lineColor: (lineData, index, id) => Colors.blue,
                  includePoints: true,
                  includeArea: false,
                ),
              ),
              MyText(
                text: "Wake Up - Avg 7:45 AM",
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.white70,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: DChartLine(
                  data: const [
                    {
                      'id': 'Line',
                      'data': [
                        {'domain': 0, 'measure': 1},
                        {'domain': 1, 'measure': 1.2},
                        {'domain': 2, 'measure': 2},
                        {'domain': 3, 'measure': 3},
                        {'domain': 4, 'measure': 5},
                        {'domain': 5, 'measure': 4.7},
                        {'domain': 6, 'measure': 4},
                      ],
                    },
                  ],
                  lineColor: (lineData, index, id) => Colors.blue,
                  includePoints: true,
                  includeArea: false,
                ),
              ),
              const ChartBar(
                text: 'Time in Bed - Avg 7hr 23m',
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 70),
                child: MyButton(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width * 0.3,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalenderScreen()));
                  },
                  roundSize: 0,
                  title: "Next",
                  color: Colors.purple,
                ),
              )

              // Container(height: 200, child: LineChartWidget())
            ],
          ),
        ),
      ),
    );
  }
}

class ChartFilterText extends StatelessWidget {
  final String title;
  const ChartFilterText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.028),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

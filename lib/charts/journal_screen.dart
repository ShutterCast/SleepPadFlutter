import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sleep_pad/charts/my_percent_indicator.dart';
import 'package:sleep_pad/charts/stepper%20chart.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

import 'color_box_with_title.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              tileMode: TileMode.clamp,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff371f56),
                Color(0xff0d0628),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: "SATURDAY",
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                    MyText(
                      text: "16th Sept - 17th Sept",
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: 30,
                    )
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const Divider(
                  color: Colors.white,
                  height: 2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    MyPercentIndicator(
                      title: "M",
                      percent: 75,
                    ),
                    MyPercentIndicator(
                      title: "T",
                      percent: 50,
                    ),
                    MyPercentIndicator(
                      title: "W",
                      percent: 65,
                    ),
                    MyPercentIndicator(
                      title: "T",
                      percent: 90,
                    ),
                    MyPercentIndicator(
                      title: "F",
                      percent: 50,
                    ),
                    MyPercentIndicator(
                      title: "S",
                      percent: 78,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                const Divider(
                  color: Colors.white,
                  height: 2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Sleep Score",
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 100,
                              lineWidth: 12,
                              percent: 83 / 100,
                              animation: true,
                              startAngle: 0,
                              animationDuration: 2500,
                              backgroundColor: Colors.white,
                              progressColor: Colors.purple,
                              circularStrokeCap: CircularStrokeCap.round,
                              center: const CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 30,
                                child: Text(
                                  "83 %",
                                  style: TextStyle(fontSize: 24, color: Colors.white70, fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MyText(
                                      text: "8h 28m",
                                      fontSize: 20,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    MyText(
                                      text: "In Bed >",
                                      fontSize: 16,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w300,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.025,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MyText(
                                      text: "7h 43m",
                                      fontSize: 20,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    MyText(
                                      text: "Asleep >",
                                      fontSize: 16,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.share,
                              size: 40,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Divider(
                  color: Colors.white,
                  height: 2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/heart-beat.png",
                                color: Colors.white70,
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.height * 0.05,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "65 BPM",
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  MyText(
                                    text: "Heart Rate >",
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/night-mode.png",
                                color: Colors.white70,
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.height * 0.05,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "9:30PM",
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  MyText(
                                    text: "Went to bed >",
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/respiratory-system.png",
                                color: Colors.white70,
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.height * 0.05,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "14 BPM",
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  MyText(
                                    text: "Respiration Rate >",
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/alarm.png",
                                color: Colors.white70,
                                height: MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.height * 0.05,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MyText(
                                    text: "7:30AM",
                                    fontSize: 20,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  MyText(
                                    text: "Woke Up >",
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w300,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const Divider(
                  color: Colors.white,
                  height: 2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      ColorBoxWithTitle(
                        color: Colors.pinkAccent,
                        text1: "Awake",
                        text2: "4%",
                        text3: "28m",
                      ),
                      ColorBoxWithTitle(
                        color: Colors.lightBlueAccent,
                        text1: "REM",
                        text2: "22%",
                        text3: "1h 35m",
                      ),
                      ColorBoxWithTitle(
                        color: Colors.blue,
                        text1: "Light",
                        text2: "56%",
                        text3: "3h 53m",
                      ),
                      ColorBoxWithTitle(
                        color: Colors.indigoAccent,
                        text1: "Deep",
                        text2: "18%",
                        text3: "1h 26m",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Awake",
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                            MyText(
                              text: "REM",
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                            MyText(
                              text: "Light",
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                            MyText(
                              text: "Deep",
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ],
                        ),
                      ),
                      const Expanded(child: ChartStepperView()),
                    ],
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                // Container(
                //   margin: const EdgeInsets.symmetric(horizontal: 70),
                //   child: MyButton(
                //     height: MediaQuery.of(context).size.height * 0.065,
                //     width: MediaQuery.of(context).size.width * 0.3,
                //     roundSize: 0,
                //     onPressed: () {
                //       Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoardScreen()));
                //     },
                //     title: "Next",
                //     fontSize: 16,
                //     fontWeight: FontWeight.w400,
                //     color: Colors.purple,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

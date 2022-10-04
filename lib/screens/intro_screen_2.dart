import 'package:flutter/material.dart';
import 'package:sleep_pad/charts/journal_screen.dart';
import 'package:sleep_pad/screens/video_player_screen.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({Key? key}) : super(key: key);

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  final url = Uri.parse("https://www.sleeppad.in/shop/");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyText(
                    textAlign: TextAlign.center,
                    text: "We welcome you to the SLEEP PAD \nCommunity, where comfort meets \n technology ",
                    color: Colors.purple,
                    maxLines: 4,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  Image.asset(
                    "assets/sleeppad-logo.png",
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.8,
                    fit: BoxFit.fitWidth,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyButton(
                            onPressed: () async {
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url, mode: LaunchMode.externalApplication);
                              } else {
                                throw "Could not launch $url";
                              }
                            },
                            title: "Pre-Order Now",
                            color: Colors.indigo,
                            height: MediaQuery.of(context).size.height * 0.062,
                            width: MediaQuery.of(context).size.width * 0.40,
                            roundSize: 0,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          MyButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerScreen()));
                            },
                            title: "Watch Video",
                            color: Colors.indigo,
                            height: MediaQuery.of(context).size.height * 0.062,
                            width: MediaQuery.of(context).size.width * 0.40,
                            roundSize: 0,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      MyButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => JournalScreen(),
                            ),
                          );
                        },
                        title: "Watch Demo",
                        color: Colors.indigo,
                        height: MediaQuery.of(context).size.height * 0.062,
                        width: MediaQuery.of(context).size.width * 0.40,
                        roundSize: 0,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

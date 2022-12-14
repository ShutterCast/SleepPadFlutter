import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleep_pad/screens/profile_additional_screen.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

import 'bt_finding_screen.dart';

class IntroScreen1 extends StatefulWidget {
  const IntroScreen1({Key? key}) : super(key: key);

  @override
  State<IntroScreen1> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen1> {
  String localHeight = "";

  @override
  void initState() {
    super.initState();
    checkBodyMass();
  }

  Future<void> checkBodyMass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    localHeight = getHeight(prefs);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return (localHeight.isEmpty)
        ? ProfileScreen()
        : SafeArea(
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      textAlign: TextAlign.center,
                      text: "Introducing SLEEP PAD - India's First \nNon-Intrusive Sleep Tracking Device \nwhich helps you improve your sleep by \nmonitoring your sleep patterns \n",
                      color: Colors.purple,
                      maxLines: 4,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    MyText(
                      textAlign: TextAlign.center,
                      text: "The SLEEP PAD App provides you with \n your own personalised Sleep \n Dashboard and a Sleep Score",
                      color: Colors.purple,
                      maxLines: 3,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    Image.asset(
                      "assets/Bed.png",
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.maxFinite,
                      fit: BoxFit.contain,
                    ),
                    MyButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const BTFindingScreen()));
                      },
                      title: "Next",
                      color: Colors.indigo,
                      width: double.maxFinite,
                      roundSize: 0,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  String getHeight(SharedPreferences prefs) {
    if (prefs.getString("height") != null) {
      return prefs.getString("height")!;
    } else {
      return "";
    }
  }
}

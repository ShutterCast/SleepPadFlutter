import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sleep_pad/screens/splash_screen.dart';
import 'package:sleep_pad/screens/video_player_screen.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class IntroScreen2 extends StatefulWidget {
  const IntroScreen2({Key? key}) : super(key: key);

  @override
  State<IntroScreen2> createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // MyText(
                  //     text: FirebaseAuth.instance.currentUser!.displayName
                  //         .toString(),
                  //     color: Colors.green),
                  MyText(
                    textAlign: TextAlign.center,
                    text:
                        "We welcome you to the SLEEP PAD \nCommunity, where comfort meets \n technology ",
                    color: Colors.purple,
                    maxLines: 4,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  Column(
                    children: [
                      MyText(
                        textAlign: TextAlign.center,
                        text: "SLEEP PAD",
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                      MyText(
                        textAlign: TextAlign.center,
                        text: "Crafted by SleepKraft",
                        color: Colors.indigo,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SplashScreen()),
                              (route) => false);
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VideoPlayerScreen()));
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

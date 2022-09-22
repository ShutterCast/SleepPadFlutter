import 'package:flutter/material.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class BTFindingScreen extends StatelessWidget {
  const BTFindingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Looking for Your ',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20, color: Colors.purple),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'SLEEP PAD...',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    MyText(
                      text: "Please Keep your smart device close to your",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      color: Colors.grey,
                      letterSpacing: 0.1,
                    ),
                    MyText(
                      text: "SLEEP PAD",
                      textAlign: TextAlign.center,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Image.asset(
                  "assets/bluetooth.png",
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Colors.amber,
                  fit: BoxFit.contain,
                ),
                Column(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Once your ',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'SLEEP PAD ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'is connected to the App, the',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'the ',
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'LED ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          TextSpan(
                            text: 'light turns green',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                MyButton(
                  width: double.maxFinite,
                  onPressed: () {},
                  title: "Cancel",
                  color: Colors.indigo,
                  fontWeight: FontWeight.w400,
                  roundSize: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

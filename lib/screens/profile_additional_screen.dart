import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleep_pad/screens/intro_screen1.dart';
import 'package:sleep_pad/widgets/custom_text_field.dart';
import 'package:sleep_pad/widgets/my_button.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

import '../Utils.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "";
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //
  //   setState(() {
  //     if (FirebaseAuth.instance.currentUser?.displayName! != "") {
  //       name = "";
  //     } else {
  //       name = FirebaseAuth.instance.currentUser!.displayName!;
  //       log(name);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: MyText(
          text: "Nice to meet you",
          fontSize: 18,
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              Align(
                alignment: Alignment.topLeft,
                child: MyText(
                  text: "Lets complete your profile with \nadditional information.",
                  fontSize: 20,
                  color: Colors.black,
                  textAlign: TextAlign.left,
                  maxLines: 3,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Container(
                height: MediaQuery.of(context).size.height * 0.34,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Height (cms)",
                          color: Colors.amber,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        CustomTextField(validator: (value) => value == "" ? "Please enter Your Height" : "", textEditingController: heightController, textInputType: TextInputType.phone, textInputAction: TextInputAction.next, hintText: "cms")
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Weight (Kgs)",
                          color: Colors.amber,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        CustomTextField(validator: (value) => value == "" ? "Please enter Your Weight" : "", textEditingController: weightController, textInputType: TextInputType.phone, textInputAction: TextInputAction.next, hintText: "kgs")
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.06),
              MyText(
                text: "Our algorithms use this information to help \ncalculate health metrics such as body fat or BMI.",
                fontSize: 15,
                color: Colors.black,
                maxLines: 4,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              MyButton(
                onPressed: () async {
                  String height = heightController.text.trim();
                  String weight = weightController.text.trim();
                  if (height != "" && weight != "") {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setString("height", height);
                    prefs.setString("weight", weight);

                    final String? localHeight = prefs.getString("height");
                    final String? localWeight = prefs.getString("weight");
                    log(localHeight!);
                    log(localWeight!);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IntroScreen1(),
                      ),
                    );
                  } else {
                    Utils.showSnackBar("Fill in the Details", Colors.red);
                  }
                },
                title: "Continue",
                color: Colors.indigo,
                height: MediaQuery.of(context).size.height * 0.065,
                width: double.maxFinite,
                fontSize: 18,
                fontWeight: FontWeight.w400,
                roundSize: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}

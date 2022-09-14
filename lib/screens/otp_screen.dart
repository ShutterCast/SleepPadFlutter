import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:sleep_pad/screens/intro_screen1.dart';

import '../Utils.dart';
import '../widgets/my_button.dart';

class OtpScreen extends StatefulWidget {
  final bool isSignUp;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final String? verificationId;
  String? imageUrl;
  OtpScreen(
      {Key? key,
      this.verificationId,
      this.phoneNumber,
      this.firstName,
      this.lastName,
      required this.isSignUp})
      : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String smsCode = "";
  OtpFieldController otpControllerPin = OtpFieldController();

  signInWithNumber() async {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId!, smsCode: smsCode);
    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .onError((error, stackTrace) => errorThrown(error!))
        .whenComplete(
          () => {
            if (FirebaseAuth.instance.currentUser != null)
              {
                if (widget.isSignUp)
                  {
                    FirebaseAuth.instance.currentUser!.updateDisplayName(
                        widget.firstName! + widget.lastName!),
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IntroScreen1()),
                        (route) => false),
                  }
                else
                  {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IntroScreen1()),
                        (route) => false),
                  }
              }
            else
              {
                Navigator.pop(context),
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "OTP Screen",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                OTPTextField(
                  controller: otpControllerPin,
                  length: 6,
                  outlineBorderRadius: 10,
                  keyboardType: TextInputType.number,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: Colors.blue,
                  ),
                  fieldWidth: 45,
                  fieldStyle: FieldStyle.box,
                  style: const TextStyle(fontSize: 18),
                  onCompleted: (pin) {
                    setState(() {
                      smsCode = pin;
                    });
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.040),
                MyButton(
                  onPressed: () {
                    signInWithNumber();
                  },
                  title: "Submit",
                  fontSize: 18,
                  color: Colors.black,
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.height * 0.18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  errorThrown(Object error) {
    log(error.toString());
    Utils.showSnackBar(text: "Invalid OTP", color: false);

    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => const AuthenticationScreen()),
    //         (route) => false);
  }
}

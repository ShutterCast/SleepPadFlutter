import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:sleep_pad/screens/intro_screen1.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

import '../Utils.dart';
import '../widgets/my_button.dart';

class OtpScreen extends StatefulWidget {
  final bool? isSignUp;
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
      this.isSignUp})
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
                if (widget.isSignUp!)
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
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  text: "Verification Code",
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  color: Colors.purple,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.050),
                MyText(
                  text: "Please enter the verification code sent",
                  fontSize: 14,
                  color: Colors.black87,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: "to ",
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                    MyText(
                      text: "+ ${widget.phoneNumber}",
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.070),
                OTPTextField(
                  controller: otpControllerPin,
                  length: 6,
                  outlineBorderRadius: 10,
                  keyboardType: TextInputType.number,
                  width: MediaQuery.of(context).size.width,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  otpFieldStyle: OtpFieldStyle(
                    enabledBorderColor: Colors.white,
                    focusBorderColor: Colors.purple,
                    borderColor: Colors.white,
                    backgroundColor: Colors.purple.shade50,
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.050),
                MyText(
                  text: "Didn't receive an OTP ?",
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.030),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Resend OTP?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                MyButton(
                    onPressed: () {
                      signInWithNumber();
                    },
                    title: "Submit",
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.indigo,
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: double.maxFinite),
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
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Utils.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/my_button.dart';
import 'otp_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoading = false;
  TextEditingController phoneNumberController = TextEditingController();

  void sendOTP() async {
    if (phoneNumberController.text.trim().length == 10) {
      String phone = "+91${phoneNumberController.text.trim()}";

      setState(() {
        isLoading = true;
      });

      // showDialog(
      //   context: context,
      //   barrierDismissible: false,
      //   builder: (context) => const Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // );

      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (credential) {},
          verificationFailed: (ex) {
            setState(() {
              isLoading = false;
            });

            Utils.showSnackBar("Error ${ex.message}", Colors.red);
          },
          codeSent: (verificationId, resendToken) {
            setState(() {
              isLoading = false;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(
                        isSignUp: false,
                        phoneNumber: phone,
                        verificationId: verificationId,
                      )),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {
            if (!mounted) return;
            setState(() {
              isLoading = false;
            });
            Utils.showSnackBar("TimeOut", Colors.red);
          },
          timeout: const Duration(seconds: 30));

      phoneNumberController.clear();
    } else {
      Utils.showSnackBar("Enter Correct Number", Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          maxLines: 1,
                          maxLength: 10,
                          textInputAction: TextInputAction.done,
                          validator: (value) => value != null && value.length < 10 ? 'Enter 10 digits' : null,
                          textEditingController: phoneNumberController,
                          textInputType: TextInputType.phone,
                          hintText: 'Phone Number (+91)',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        MyButton(
                            height: MediaQuery.of(context).size.height * 0.065,
                            width: double.maxFinite,
                            roundSize: 0,
                            onPressed: () {
                              if (phoneNumberController.text.trim() != "") {
                                sendOTP();
                              } else {
                                Utils.showSnackBar("Enter Phone Number", Colors.red);
                              }
                            },
                            title: "Continue",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.indigo)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'By clicking on \'Continue\', I accept the ',
                            style: TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                          Text(
                            'Terms',
                            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'and Conditions',
                            style: TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                          Text(
                            'and the',
                            style: TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                          Text(
                            ' Privacy Policy',
                            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        isLoading
            ? Container(
                height: double.maxFinite,
                width: double.maxFinite,
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Container(),
      ],
    );
  }
}

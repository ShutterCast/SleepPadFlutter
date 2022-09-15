import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sleep_pad/widgets/my_button.dart';

import '../Utils.dart';
import '../widgets/custom_text_field.dart';
import 'otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isLoading = false;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  void sendOTP() async {
    if (phoneNumberController.text.trim().length == 10 &&
        firstNameController.text.trim() != "" &&
        lastNameController.text.trim() != "") {
      String phone = "+91${phoneNumberController.text.trim()}";

      setState(() {
        isLoading = true;
      });

      // showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (context) => const Center(
      //           child: CircularProgressIndicator(),
      //         ));

      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          verificationCompleted: (credential) {},
          verificationFailed: (ex) {
            setState(() {
              isLoading = false;
            });

            Utils.showSnackBar(color: false, text: "Error");
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => AuthenticationScreen(),
            //   ),
            // );
          },
          codeSent: (verificationId, resendToken) {
            setState(() {
              isLoading = false;
            });

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OtpScreen(
                        isSignUp: true,
                        phoneNumber: phone,
                        verificationId: verificationId,
                        firstName: firstNameController.text.trim(),
                        lastName: lastNameController.text.trim(),
                      )),
            );
          },
          codeAutoRetrievalTimeout: (verificationId) {
            if (mounted) return;
            setState(() {
              isLoading = false;
            });
            Utils.showSnackBar(color: false, text: "Timeout");
          },
          timeout: const Duration(seconds: 60));
      phoneNumberController.clear();
      firstNameController.clear();
      lastNameController.clear();
    } else {
      Utils.showSnackBar(color: false, text: "Fill all Fields");
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
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(
                        maxLines: 1,
                        validator: (value) =>
                            value == "" ? "Please enter Your First Name" : "",
                        textEditingController: firstNameController,
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.name,
                        hintText: 'First Name',
                      ),
                      CustomTextField(
                        maxLines: 1,
                        textInputAction: TextInputAction.done,
                        validator: (value) =>
                            value == "" ? "Please enter Your Last Name" : "",
                        textEditingController: lastNameController,
                        textInputType: TextInputType.name,
                        hintText: 'Last Name',
                      ),
                      CustomTextField(
                        maxLines: 1,
                        maxLength: 10,
                        textInputAction: TextInputAction.done,
                        validator: (value) => value != null && value.length < 10
                            ? 'Enter 10 digits'
                            : null,
                        textEditingController: phoneNumberController,
                        textInputType: TextInputType.phone,
                        hintText: 'Phone Number (+91)',
                      ),
                      MyButton(
                          height: MediaQuery.of(context).size.height * 0.065,
                          width: double.maxFinite,
                          roundSize: 0,
                          onPressed: () {
                            sendOTP();
                          },
                          title: "Continue",
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.indigo)
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.22),
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
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                          Text(
                            'Terms',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'and Conditions',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                          Text(
                            'and the',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 14),
                          ),
                          Text(
                            ' Privacy Policy',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
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

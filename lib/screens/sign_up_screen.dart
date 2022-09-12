import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';
import '../widgets/my_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      textInputAction: TextInputAction.done,
                      validator: (value) => value != null && value.length < 8
                          ? 'Enter min. 8 characters'
                          : null,
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
                        onPressed: () {},
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
                        style: TextStyle(color: Colors.black87, fontSize: 14),
                      ),
                      Text(
                        'and the',
                        style: TextStyle(color: Colors.black87, fontSize: 14),
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
    );
  }
}

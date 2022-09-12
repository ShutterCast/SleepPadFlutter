import 'package:flutter/material.dart';
import 'package:sleep_pad/screens/login_screen.dart';
import 'package:sleep_pad/screens/sign_up_screen.dart';
import 'package:sleep_pad/widgets/text_widget.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: MyText(
            text: "Welcome",
            fontSize: 18,
          ),
          bottom: TabBar(
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            // indicatorSize: TabBarIndicatorSize.tab,
            // indicator: BoxDecoration(
            //   color: Colors.amber,
            // ),
            unselectedLabelColor: Colors.white.withOpacity(0.8),
            labelStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.6),
            tabs: const [
              Tab(text: "SIGN UP"),
              Tab(text: "SIGN IN"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginScreen(),
            SignUpScreen(),
          ],
        ),
        drawer: Drawer(),
      ),
    );
  }
}

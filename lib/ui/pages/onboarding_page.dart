import 'package:flutter/material.dart';
import 'package:ngepet_id/shared/theme.dart';

import '../widgets/custom_button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Center(
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 25,
                    ),
                    width: 318,
                    height: 312,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/ilustrasi_splash.png',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 104,
                  ),
                  CustomButton(
                    title: "LOGIN",
                    width: 319,
                    color: kWhiteColor,
                    titleColor: kPrimaryColor,
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    title: "REGISTER",
                    width: 319,
                    color: kWhiteColor,
                    titleColor: kPrimaryColor,
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

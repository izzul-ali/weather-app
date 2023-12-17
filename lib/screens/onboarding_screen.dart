import 'package:flutter/material.dart';
import 'package:weather_app/screens/home_screen.dart';

import '../widgets/background.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundApp(),
          Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/0.png',
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(height: 50),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Weather\n',
                  style: TextStyle(
                    fontSize: 64,
                    fontFamily: 'Poppins',
                    height: 1,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'ForeCasts',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins',
                        color: Color(0xffDDB130),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 2),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xffDDB130),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}

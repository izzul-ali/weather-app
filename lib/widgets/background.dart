import 'package:flutter/material.dart';

class BackgroundApp extends StatelessWidget {
  const BackgroundApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff192241),
            Color(0xff473A92),
            Color(0xff973AA9),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ocr_scanner/screen/home_screen/home_screen.dart';
import 'package:ocr_scanner/widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _navigateToHome();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(
      const Duration(milliseconds: 3000),
      () {},
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}

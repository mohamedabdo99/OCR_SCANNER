import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            //
            child: Image.asset(
              'assets/images/bacground.png',
              height: 240.0,
              width: 240.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '''instant conversion to text with OCR , don't worry about typing''',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontFamily: 'Bold',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

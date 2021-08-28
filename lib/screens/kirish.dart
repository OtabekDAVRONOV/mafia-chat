// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KirishEkrani extends StatefulWidget {
  const KirishEkrani({Key? key}) : super(key: key);

  @override
  _KirishEkraniState createState() => _KirishEkraniState();
}

class _KirishEkraniState extends State<KirishEkrani>
    with TickerProviderStateMixin {
  AnimationController? controller;
  AnimationController? controllerText;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      // value: 1,
      duration: const Duration(milliseconds: 500),
    );
    controllerText = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    controller!.forward();
    controllerText!.forward();

    // controller!.reverse(from: 1);

    controller!.addListener(() {
      setState(() {});
    });
    controllerText!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF9096E6),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.cover,
                    ),
                    height: controller!.value * 80,
                  ),
                ),
                const SizedBox(
                  width: 30.0,
                ),
                Text(
                  "Mafia Chat",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: controllerText!.value * 33.0,
                      fontWeight: FontWeight.w800),
                )
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  60.0,
                ),
                primary: const Color(0xFFFFDA3E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              icon: const Icon(
                Icons.handyman,
                color: Colors.black,
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'sign_in'),
              label: const Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(
                  double.infinity,
                  60.0,
                ),
                primary: const Color(0xFFFFDFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              icon: const Icon(
                Icons.king_bed,
                color: Colors.black,
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, 'sign_up'),
              label: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

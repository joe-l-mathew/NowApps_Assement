import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import 'home_screen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  final otp_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * .1,
            ),
            const Text("OTP HAS BEEN SENT"),
            SizedBox(
              height: height * .1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Pinput(
                controller: otp_controller,
                senderPhoneNumber: "9496283576",
                length: 6,
                autofocus: true,
                defaultPinTheme: PinTheme(
                  width: 56,
                  height: 56,
                  textStyle: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 140, 255)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () async {
                  if (otp_controller.text.length == 6) {
                    // ignore: use_build_context_synchronously
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool(loginKey, true);
                    // ignore: use_build_context_synchronously
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const HomeScreen()),
                      (route) => false,
                    );
                  }
                },
                child: const Text("Submit OTP")),
            const SizedBox(
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}

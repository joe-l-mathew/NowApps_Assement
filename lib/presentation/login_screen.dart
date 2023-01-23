import 'package:flutter/material.dart';

import '../functions/show_snackbar.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController mobNumController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .1,
            ),
            const Text("LOGIN SCREEN"),
            SizedBox(
              height: height * 0.2,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: mobNumController,
                  decoration: const InputDecoration(
                    prefix: Text("+91 "),
                    border: OutlineInputBorder(),
                    labelText: 'Enter Mobile Number',
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  print(mobNumController.text.trim());
                  if (mobNumController.text.trim().length == 10) {
                    //nxt screeen
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => OtpScreen()));
                  } else {
                    showSnackbar("Enter a valid phoneNumber", context);
                  }
                },
                child: const Text("Get OTP")),
            const Spacer()
          ],
        ),
      ),
    ));
  }
}

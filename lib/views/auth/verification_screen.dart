import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject29/controller/verification_controller.dart';
import 'package:pinput/pinput.dart';

import '../../controller/register_controller.dart';

class VerificationScreen extends StatefulWidget {
  final int verificationId;
  const VerificationScreen({super.key, required this.verificationId});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {

  VerificationController verificationController = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/verification.png',
                  width: 200,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Otp Verification",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  "We have sent an OTP to your phone\nnumber !",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 17,
                ),
                Pinput(
                  controller: verificationController.verifyController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,

                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  // showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    print(widget.verificationId.toString()+'THIS IS VERIFICATION ID ON VERIFICTAION SCREEN');
                    verificationController.verificationMethod(widget.verificationId, int.parse(verificationController.verifyController.text,),context);
                  },
                  height: 55,
                  child: Center(
                    child: Text("Submit"),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        )),
                    Text(
                      "  Or continue with  ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    ),
                    Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                        )),
                  ],
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: Colors.grey,width: 2
                          )
                      ),
                      child: Center(
                        child: Image.asset('assets/images/google.png',),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: Colors.grey,width: 2
                          )
                      ),
                      child: Center(
                        child: Image.asset('assets/images/apples.png',),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              color: Colors.grey,width: 2
                          )
                      ),
                      child: Center(
                        child: Image.asset('assets/images/facebook.png',),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),),
                    Text("  Login",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue[200]),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

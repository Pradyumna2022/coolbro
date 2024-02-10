

import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newproject29/home_screen.dart';
import 'package:newproject29/views/auth/verification_screen.dart';

class VerificationController extends GetxController{

  final verifyController = TextEditingController();

  void verificationMethod(int Id, int verification,BuildContext context) async{
    print('$verification THIS IS VERIFICATION ID ON VERIFICTAION Getx');
    print("$Id THIS IS VERIFICATION ID ON VERIFICTAION Getx");
    try{
      var response  = await http.post(Uri.parse('https://api-coolbro.gvmtechnologies.com/auth/verify_otp'),
        body: jsonEncode({
          "ID":Id,
          "Otp":verification
        }),
        headers: {
          'Content-Type': 'application/json',
        },);
      print(verification);
      print(response.statusCode);
      print(response.body);
      var data = jsonDecode(response.body);
      if(response.statusCode == 200){

        Get.snackbar(data['message'], 'verified',backgroundColor: Colors.white,colorText: Colors.black);
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }else{
        Get.snackbar(data['message'], 'verified',backgroundColor: Colors.white,colorText: Colors.black);
      }
    }catch(e){
      print(e.toString());
    }
  }
}


import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newproject29/views/auth/verification_screen.dart';

class VerificationController extends GetxController{

  final verifyController = TextEditingController();

  void verificationMethod(int Id, String verification) async{
    try{
      var response  = await http.post(Uri.parse('https://api-coolbro.gvmtechnologies.com/auth/verify_otp'),
        body: jsonEncode({
          "ID":77,
          "Otp":verification
        }),
        headers: {
          'Content-Type': 'application/json',
        },);
      print(verification);
      print(response.statusCode);
      if(response.statusCode == 200){
        Get.snackbar('SuccessFully', 'verified',backgroundColor: Colors.white,colorText: Colors.black);
        // Get.to(VerificationScreen());
      }else{
        print('not respone of 200');
      }
    }catch(e){
      print(e.toString());
    }
  }
}
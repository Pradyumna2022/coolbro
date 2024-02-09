

import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newproject29/views/auth/verification_screen.dart';

import '../home_screen.dart';
class LoginController extends GetxController{

  final emailController = TextEditingController();

  void loginMethod( String email) async{
    try{
      var response  = await http.post(Uri.parse('https://api-coolbro.gvmtechnologies.com/auth/send_otp'),
        body: jsonEncode({
          "Email": email,
          "Login_type": "0"
        }),
        headers: {
          'Content-Type': 'application/json',
        },);
      print(email);
      print(response.statusCode);
      //
      print(response.body);
      if(response.statusCode == 200){
        Get.snackbar('SuccessFully', 'Go to verification Screen',backgroundColor: Colors.white,colorText: Colors.black);
        var data = jsonDecode(response.body);
        print(data['User']['ID']);
        Get.to(VerificationScreen(id: data['User']['ID'],));
      }else{
        print('not respone of 200');
      }
    }catch(e){
      print(e.toString());
    }
  }
}
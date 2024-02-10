

import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newproject29/views/auth/verification_screen.dart';

import '../home_screen.dart';
class RegisterController extends GetxController{

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void registerMethod(String name, String email, BuildContext context) async{
    try{
      var response  = await http.post(Uri.parse('https://api-coolbro.gvmtechnologies.com/auth/register'),
          body: jsonEncode({
            "Name": name.toString(),
            "Email": email.toString(),
            "Login_type": 0,
            "Role": "User"
          }),
        headers: {
          'Content-Type': 'application/json',
        },);
      var data = jsonDecode(response.body);
      print(data['User']['ID']);
      print(name);
      print(email);
      print(response.statusCode);
      print(response.body);
      if(response.statusCode == 200){
        Get.snackbar('SuccessFully', 'Welcome Home Screen',backgroundColor: Colors.white,colorText: Colors.black);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      }else{
        print('not respone of 200');
      }
    }catch(e){
      print(e.toString());
    }
  }
}
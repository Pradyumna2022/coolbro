import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject29/controller/login_controller.dart';
import 'package:newproject29/views/auth/register_page.dart';

import '../../controller/register_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/appbar.png',
                  width: 200,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  "Login with your phone number and\naccess our services",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 17,
                ),

                Form(
                  key:  formkey ,
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "Enter your Email";
                      }
                    },
                    controller: loginController.emailController,
                    decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        enabledBorder: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        errorBorder: OutlineInputBorder(),
                        border: OutlineInputBorder(),
                        hintText: 'Email'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    if(formkey.currentState!.validate()){
                      loginController.loginMethod(loginController.emailController.text.toString(),context);
                    }
                  },
                  height: 55,
                  child: Center(
                    child: Text("Login"),
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
                    GestureDetector(
                      onTap: (){
                        Get.to(RegisterPage());
                      },
                      child: Text("  Sign up",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.blue[200]),),
                    ),
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

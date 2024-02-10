import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newproject29/views/auth/login_page.dart';

import '../../controller/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();
  RegisterController registerController = Get.put(RegisterController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
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
                  "Register",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  "Just fill up details below and you are\ngood to go !",
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
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter your name";
                          }
                        },
                        controller: registerController.nameController,
                        decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                            hintText: "Name"
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Enter your email";
                          }
                        },
                        controller: registerController.emailController,
                        decoration: InputDecoration(
                            fillColor: Colors.white70,
                            filled: true,
                            enabledBorder: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                            hintText: "Email"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                   if(formkey.currentState!.validate()){

                     registerController.registerMethod(registerController.nameController.text.toString(),
                         registerController.emailController.text.toString(),context);
                   }
                  },
                  height: 55,
                  child: Center(
                    child: Text("Sign up"),
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
                        Get.to(LoginPage());
                      },
                      child: Text("  Login",
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

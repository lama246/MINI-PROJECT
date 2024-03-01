import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signup_login/wrapper.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
        Get.offAll(const Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: const Text("Sign up")),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextField(
            controller: email,
            decoration:const InputDecoration(hintText: 'enter email id'),
          ),
          TextField(
            controller: password,
            decoration: const InputDecoration(hintText: 'enter password'),
          ),
          ElevatedButton(onPressed: (()=>signup()), child:const Text('Sign up'))
          
        ],),
      ),
    ),);
  }
}

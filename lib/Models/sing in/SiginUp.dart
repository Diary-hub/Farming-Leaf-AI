import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/sing%20in/userModel.dart';
import 'package:flutter_application_1/cons.dart';
import 'package:flutter_application_1/custom_textfeild.dart';
import 'package:flutter_application_1/Models/sing%20in/login.dart';
import 'package:page_transition/page_transition.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future<void> createAccount() async {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        FirebaseFirestore db = FirebaseFirestore.instance;
        UserCredential currrentUser = await auth.createUserWithEmailAndPassword(
            email: emailController.text.trim(), password: passwordContoller.text);
        final user = UserModel(id: currrentUser.user!.uid, email: emailController.text.trim());
        await db.collection('Users').doc(user.id).set(user.toJson());
        currrentUser.user!.sendEmailVerification();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please Verify Your Email!"),
          backgroundColor: Colors.blueGrey.shade900,
        ));
        Navigator.pushReplacement(
            context, PageTransition(child: SingIn(), type: PageTransitionType.bottomToTop));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("$e"),
          backgroundColor: Colors.blueGrey.shade900,
        ));
        print('FirebaseAuth Error: $e');
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                "https://cdni.iconscout.com/illustration/premium/thumb/boy-and-girl-doing-id-registration-9154238-7508887.png",
                fit: BoxFit.cover,
              ),
              Center(
                  child: const Text(
                " خۆ تۆمارکردن",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
              )),
              const SizedBox(
                height: 10,
              ),
              CustomTextFeild(
                controller: emailController,
                obscureText: false,
                hintText: "یمێلەکەت بنوسە",
                icon: Icons.alternate_email,
              ),
              CustomTextFeild(
                controller: passwordContoller,
                obscureText: false,
                hintText: "وشەی نهێنی بنوسە",
                icon: Icons.alternate_email,
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  createAccount();
                },
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: cons.primaryColor, borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: const Center(
                    child: Text(
                      "داخل بوون",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('یان'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                    border: Border.all(color: cons.primaryColor),
                    borderRadius: BorderRadius.circular(10)),
              ),
              //           Padding(
              //           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //         child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //       children: [
              //       SizedBox(
              //       height: 30,
              //     child: Image.network(
              //       "https://static.vecteezy.com/system/resources/previews/022/484/503/non_2x/google-lens-icon-logo-symbol-free-png.png"),
              //),
              //                 Text(
              //                 " بە گۆگل داخڵ بە",
              //               style: TextStyle(color: cons.primaryColor),
              //           )
              //       ],
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      PageTransition(child: SingIn(), type: PageTransitionType.bottomToTop));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text.rich(
                        TextSpan(children: [
                          TextSpan(text: 'تۆمارت هەیە؟', style: TextStyle(color: cons.blackcolor)),
                          TextSpan(text: 'تۆماربە ', style: TextStyle(color: cons.primaryColor))
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

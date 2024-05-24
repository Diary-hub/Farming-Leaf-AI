import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/sing%20in/login.dart';
import 'package:flutter_application_1/cons.dart';
import 'package:flutter_application_1/custom_textfeild.dart';
import 'package:page_transition/page_transition.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    Size size = MediaQuery.of(context).size;

    Future<void> forgotPassword() async {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;

        auth.sendPasswordResetEmail(email: emailController.text.trim());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Email Send!"),
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVZ14159bXExoKON1uzMWmoDJNYEZuIkG_KA&usqp=CAU",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
                child: const Text(
              "  ‌وشەی نهێنیت بیر چووە؟",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
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
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                forgotPassword();
              },
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: cons.primaryColor, borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: const Center(
                  child: Text(
                    "وشەی نهێنی ڕێکبخەرەوە ",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, PageTransition(child: SingIn(), type: PageTransitionType.bottomToTop));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(text: 'تۆمارت هەیە؟ ', style: TextStyle(color: cons.blackcolor)),
                        TextSpan(text: 'تۆمار بە', style: TextStyle(color: cons.primaryColor))
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

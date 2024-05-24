import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/root/secand.dart';
import 'package:flutter_application_1/Models/sing%20in/ForgetPassowrd.dart';
import 'package:flutter_application_1/Models/sing%20in/SiginUp.dart';
import 'package:flutter_application_1/cons.dart';
import 'package:flutter_application_1/custom_textfeild.dart';
import 'package:page_transition/page_transition.dart';

class SingIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();

  SingIn({super.key});

  get favoratedPlants => null;

  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      try {
        FirebaseAuth auth = FirebaseAuth.instance;

        UserCredential currrentUser = await auth.signInWithEmailAndPassword(
            email: emailController.text.trim(), password: passwordContoller.text);

        if (currrentUser.user != null) {
          if (currrentUser.user!.emailVerified) {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    child: secand(
                      favoratedPlants: [],
                      favoratedPlants2: [],
                    ),
                    type: PageTransitionType.bottomToTop));
          } else {
            currrentUser.user!.sendEmailVerification();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Please Verify Your Email!"),
              backgroundColor: Colors.blueGrey.shade900,
            ));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("No Account  Found!"),
            backgroundColor: Colors.blueGrey.shade900,
          ));
        }
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB0PLpiebeQ5yiCYv7Q9QBVI4BkcaGaOOsQgZYLZwbD4Cj8EDic7-cLL0pT-J2U2HW4pw&usqp=CAU",
              fit: BoxFit.cover,
            ),
            Center(
                child: const Text(
              " چوونە ژوورەوە",
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
              obscureText: true,
              hintText: "وشەی نهێنی بنوسە",
              icon: Icons.password,
            ),
            const SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () {
                login();
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
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    PageTransition(child: ForgetPass(), type: PageTransitionType.bottomToTop));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: 'وشەی نهێنیت بیر چووە؟',
                            style: TextStyle(color: cons.blackcolor)),
                        TextSpan(text: 'کلیک بکە', style: TextStyle(color: cons.primaryColor))
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('یان'),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(child: Divider()),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: size.width,
              decoration: BoxDecoration(
                  border: Border.all(color: cons.primaryColor),
                  borderRadius: BorderRadius.circular(10)),
            ),
            //     Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //   child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            // children: [
            // SizedBox(
            // height: 30,
            //child: Image.network(
            //  "https://static.vecteezy.com/system/resources/previews/022/484/503/non_2x/google-lens-icon-logo-symbol-free-png.png"),
            //         ),
            //       Text(
            //       " بە گۆگل داخڵ بە",

            //     style: TextStyle(color: cons.primaryColor),
            // )
            //    ],
            // ),
            // ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, PageTransition(child: SignUp(), type: PageTransitionType.bottomToTop));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(text: 'تۆمارکردنی نوێ؟', style: TextStyle(color: cons.blackcolor)),
                        TextSpan(text: 'تۆمار بکە', style: TextStyle(color: cons.primaryColor))
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

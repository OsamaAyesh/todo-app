import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/auth_screen/forget_password_screens/forget_password_screen.dart';
import 'package:todo/app_screen/auth_screen/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool visable = true;
  late TextEditingController email;
  late TextEditingController password;

  @override
  void initState() {
    // TODO: implement initState
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Image.asset(
                  "images/splash1.png",
                  width: width * 0.8,
                  height: height * 0.3,
                  fit: BoxFit.fitWidth,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Center(
              child: Text(
                "Sign In",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "phtuonganh@gmail.com",
                  hintStyle: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFF0F0A39)),
                  fillColor: const Color(0XFFF5F6FA),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0XFFF5F6FA),
                      )),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0XFFF5F6FA),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: TextField(
                controller: password,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visable = !visable;
                      });
                    },
                    icon: visable
                        ? const Icon(Icons.remove_red_eye_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                    color: const Color(0XFFCBC9D9),
                  ),
                  hintText: "Enter password",
                  hintStyle: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFFCBC9D9)),
                  fillColor: const Color(0XFFF5F6FA),
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Color(0XFFF5F6FA),
                      )),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                      color: Color(0XFFF5F6FA),
                    ),
                  ),
                ),
                obscureText: visable,
              ),
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.leftToRight,
                            child:  const ForgetPasswordScreen()));                    },
                  child: Text(
                    "Forgot your password?",
                    style: GoogleFonts.roboto(
                      color: const Color(0XFF7B7890),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.04,
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: ElevatedButton(
                onPressed: () {
                  if(email.text.length>9&&password.text.length>7){
                    Navigator.pushNamed(context, "/main_screen");
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF7C37FA),
                    minimumSize: Size(width, height * 0.07),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            color: Color(0XFF7C37FA), width: 2))),
                child: Text(
                  "Sign In",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Center(
              child: Image.asset(
                "images/or.png",
                width: width,
                fit: BoxFit.fitWidth,
                height: height * 0.06,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.1,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(width * 0.3, height * 0.06),
                    backgroundColor: const Color(0XFF3C5A99),
                  ),
                  child: Row(
                    children: [
                      Image.asset("images/facebook.png"),
                      Text(
                        "Facebook",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size(width * 0.3, height * 0.06),
                    backgroundColor: const Color(0XFFF95341),
                  ),
                  child: Row(
                    children: [
                      Image.asset("images/google.png"),
                      Text(
                        "Google",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.1,
                ),
              ],
            ),
            SizedBox(height: height*0.02,),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Text(
                  "Don’t have account?",
                  style: GoogleFonts.roboto(
                    color: const Color(0XFF7B7890),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: width*0.01,),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.rightToLeft,
                            child:  const  SignUpScreen()));
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.roboto(
                      color: const Color(0XFF7C37FA),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

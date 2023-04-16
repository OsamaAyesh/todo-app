import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/auth_screen/sign_in_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  late Timer _timer;
   int counter=60;
  void startTimer(){
    counter =60;
    _timer=Timer.periodic(const Duration(seconds:1 ), (timer) {
      setState(() {
        if(counter>0){
          counter--;
        }else{
          // Navigator.
        }
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0XFF0F0A39),
            )),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Verify Code",
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF0F0A39)),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                child: Text(
                  "Check your email address, we have sent",
                  style: GoogleFonts.roboto(
                    color: const Color(0XFF7B7890),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Text(
                  "you the code at",
                  style: GoogleFonts.roboto(
                    color: const Color(0XFF7B7890),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "phtuonganh@gmail.com",
                  style: GoogleFonts.roboto(
                    color: const Color(0XFF7C37FA),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height * 0.07,
                  width: width * 0.14,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
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
                  height: height * 0.07,
                  width: width * 0.14,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
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
                  height: height * 0.07,
                  width: width * 0.14,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
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
                  height: height * 0.07,
                  width: width * 0.14,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    decoration: InputDecoration(
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
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.08,
                ),
                Text(
                  "Didn’t receive the code?",
                  style: GoogleFonts.roboto(
                    color: const Color(0XFF7B7890),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const Expanded(child: SizedBox()),
                Column(
                  children: [
                    Text(
                      "Resend",
                      style: GoogleFonts.roboto(
                        color: const Color(0XFF7C37FA),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height*0.01,),
                    Text("(00:$counter)",style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w400,
                      color: const Color(0XFF7B7890)
                    ),)
                  ],
                ),
                SizedBox(
                  width: width * 0.08,
                ),
              ],
            ),
            SizedBox(height: height*0.07,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          duration: const Duration(milliseconds: 500),
                          type: PageTransitionType.rightToLeft,
                          child:  const SignInScreen()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF7C37FA),
                    minimumSize: Size(width, height * 0.07),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(
                            color: Color(0XFF7C37FA), width: 2))),
                child: Text(
                  "Send",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

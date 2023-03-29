import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/auth_screen/forget_password_screens/verify_code_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late TextEditingController email;
  String enable = "";
  bool enableButton = false;

  @override
  void initState() {
    // TODO: implement initState
    email = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    super.dispose();
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
          "Forgot Password",
          style: GoogleFonts.roboto(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color(0XFF0F0A39)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.07,
                ),
                Text(
                  "Enter ",
                  style: GoogleFonts.roboto(
                    color: const Color(0XFF7B7890),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "your email address",
                  style: GoogleFonts.roboto(
                    color: const Color(0XFF7C37FA),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  " to reset your ",
                  style: GoogleFonts.roboto(
                    color: const Color(0XFF7B7890),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.07,
                ),
                Text(
                  " password.",
                  style: GoogleFonts.roboto(
                    color: const Color(0XFF7B7890),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    enable = value;
                    if (enable.length > 9) {
                      enableButton = true;
                    }
                  });
                },
                controller: email,
                decoration: InputDecoration(
                  hintText: "Enter Email",
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
              ),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: ElevatedButton(
                onPressed: () {
                  if(enableButton){
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.rightToLeft,
                            child:  const VerifyCodeScreen()));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: enableButton? const Color(0XFF7C37FA):const Color(0XFFF2F2F3),
                  minimumSize: Size(width, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "Send",
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: enableButton?Colors.white:const Color(0XFFCBC9D9)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

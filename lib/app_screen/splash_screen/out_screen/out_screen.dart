import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/auth_screen/sign_in_screen.dart';
import 'package:todo/app_screen/auth_screen/sign_up_screen.dart';

class OutScreen extends StatefulWidget {
  const OutScreen({Key? key}) : super(key: key);

  @override
  State<OutScreen> createState() => _OutScreenState();
}

class _OutScreenState extends State<OutScreen> {
  final PageController _pageController = PageController();
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String image = "images/dot1.png";

    if (pageIndex == 0) {
      image = "images/dot1.png";
    } else if (pageIndex == 1) {
      image = "images/dot2.png";
    } else {
      image = "images/dot3.png";
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 13.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 28.w,
                ),
                Image.asset(
                  image,
                  height: 14.h,
                  width: 34.w,
                ),
            Expanded(child: SizedBox()),
                pageIndex != 2
                    ? TextButton(
                        onPressed: () {
                          _pageController.animateToPage(2,
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeInBack);
                        },
                        child: Text(
                          "Skip",
                          style: GoogleFonts.roboto(
                            color: const Color(0XFF7C37FA),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : TextButton(
                        onPressed: () {},
                        child: Text(
                          "",
                          style: GoogleFonts.roboto(
                            color: const Color(0XFF7C37FA),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                SizedBox(
                  width: 28.w,
                ),
              ],
            ),
            SizedBox(
              height: 64.h,
            ),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 28.w,
                          ),
                          Text(
                            "Welcome!",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.w),
                        child: Text(
                          "Focus on what matters most.Manage everything, from big projects to personal moments.",
                          style: GoogleFonts.roboto(
                              color: const Color(0XFF7B7890),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(height: 118.h,),
                      Image.asset(
                        "images/out1.png",
                        height: 375.73.h,
                        width: 375.w,

                      ),
                      SizedBox(height: 50.6.h,),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 28.w,
                          ),
                          Text(
                            "Welcome!",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.w),
                        child: Text(
                          "Focus on what matters most.Manage everything, from big projects to personal moments.",
                          style: GoogleFonts.roboto(
                              color: const Color(0XFF7B7890),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 118.6.h,
                      ),
                      Image.asset(
                        "images/out2.png",
                        height: 375.73.h,
                        width: 375.w,
                      ),
                      SizedBox(
                        height: 51.h,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 28.w,
                          ),
                          Text(
                            "Welcome!",
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 28.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.w),
                        child: Text(
                          "Plan, record and manage projects on any device - even offline.",
                          style: GoogleFonts.roboto(
                              color: const Color(0XFF7B7890),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 61.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.w),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: const Duration(milliseconds: 500),
                                    type: PageTransitionType.rightToLeft,
                                    child: const SignInScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: Size(double.infinity, 44.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  side:  BorderSide(
                                      color: Color(0XFF7C37FA), width: 2.w))),
                          child: Text(
                            "Sign In",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: const Color(0XFF7C37FA)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:28.w),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    duration: const Duration(milliseconds: 500),
                                    type: PageTransitionType.rightToLeft,
                                    child: const SignUpScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFF7C37FA),
                              minimumSize: Size(double.infinity, 44.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  side:  BorderSide(
                                      color: Color(0XFF7C37FA), width: 2.w))),
                          child: Text(
                            "Sign Up",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Image.asset(
                        "images/out3.png",
                        height: 375.73.h,
                        width: 375.w,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo/app_screen/auth_screen/forget_password_screens/forget_password_screen.dart';
import 'package:todo/app_screen/auth_screen/forget_password_screens/verify_code_screen.dart';
import 'package:todo/app_screen/auth_screen/sign_in_screen.dart';
import 'package:todo/app_screen/auth_screen/sign_up_screen.dart';
import 'package:todo/app_screen/home_screen/edit_profile_screen.dart';
import 'package:todo/app_screen/home_screen/main_screen.dart';
import 'package:todo/app_screen/splash_screen/out_screen/out_screen.dart';
import 'package:todo/app_screen/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,i){
        return MaterialApp(
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: "/splash_screen",
          routes: {
            "/splash_screen":(context)=>const SplashScreen(),
            "/out_screen":(context)=>const OutScreen(),
            '/sign_in_screen':(context)=>const SignInScreen(),
            '/sign_up_screen':(context)=>const SignUpScreen(),
            '/forget_password_screen':(context)=>const ForgetPasswordScreen(),
            '/verify_code_screen':(context)=>const VerifyCodeScreen(),
            '/main_screen':(context)=> MainScreen(image: "images/profileImage.png",email: "phtounganch@gmail.com",userName: "phtuonganh",),
            // '/edit_profile_screen':(context)=>EditProfileScreen();
          },
        );
      },
    );
  }
}

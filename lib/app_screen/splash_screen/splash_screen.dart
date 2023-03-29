import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/splash_screen/out_screen/out_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.push(
          context,
          PageTransition(
            duration: Duration(seconds: 1),
              type: PageTransitionType.rightToLeft,
              child:  const OutScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(child: SizedBox()),
                Image.asset("images/splash1.png",width: width*0.7,height: height*0.25),
              ],
            ),
            const Expanded(child: SizedBox()),
            Image.asset("images/logo.png",width: width*0.4,height: height*0.15,fit: BoxFit.fitWidth,),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                Image.asset("images/splash 2.png",width: width*0.7,height: height*0.25,),
                const Expanded(child: SizedBox()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

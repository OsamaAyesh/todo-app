import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/home_screen/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
   ProfileScreen({Key? key,required this.image,required this.userName,required this.email}) : super(key: key);
  String image;
  String userName;
  String email;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>{
  late TextEditingController email;
  late TextEditingController userName;
  @override
  void initState() {
    // TODO: implement initState
    email=TextEditingController();
    userName=TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    userName.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account records",
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     PageTransition(
            //         duration: const Duration(milliseconds: 500),
            //         type: PageTransitionType.rightToLeft,
            //         child:  const Edi()));
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen(
              picture: null,
            )));
          }, icon:const  Icon(Icons.edit,color: Colors.black,))
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: height*0.05,),
          Center(child: Image.asset(widget.image,height: 106.h,width: 92.w,)),
          SizedBox(height: height*0.04,),
          Center(
            child: Text(widget.userName,style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),),
          ),
          SizedBox(height: height*0.01,),
          Center(child: Image.asset("images/profileImage2.png",width: width*0.2,fit: BoxFit.fitWidth,)),
          SizedBox(height: height*0.05,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: TextField(
              controller: userName,
              enabled: false,
              decoration: InputDecoration(
                hintText: widget.userName,
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
          SizedBox(height: height*0.02,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: TextField(
              controller: email,
              enabled: false,
              decoration: InputDecoration(
                hintText: widget.email,
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
        ],
      ),
    );
  }
}

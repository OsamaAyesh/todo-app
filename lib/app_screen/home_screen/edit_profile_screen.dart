import 'dart:convert';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/home_screen/camera_page_screen.dart';
import 'package:todo/app_screen/home_screen/main_screen.dart';
import 'package:todo/app_screen/home_screen/profile_screen.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({Key? key, this.picture}) : super(key: key);

  // final XFile picture;
  XFile? picture;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController email;
  late TextEditingController userName;
  late String namePicture;

  @override
  void initState() {
    // TODO: implement initState
    email = TextEditingController();
    userName = TextEditingController();
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
    if (widget.picture == null) {
      namePicture = "images/imageProfileEdit.png";
    } else {
      namePicture = widget.picture!.path;
    }
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit account",
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
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async{
                // String imagePath =namePicture;
                // File imagefile = File(widgeti); //convert Path to File
                // Uint8List imagebytes = await imagefile.readAsBytes(); //convert to bytes
                // String base64string = base64.encode(imagebytes); //convert bytes to base64 string
                // print(base64string);


                Navigator.push(
                    context,
                    PageTransition(
                        child: MainScreen(
                          image: namePicture,
                          email: email.text,
                          userName: userName.text,
                        ),
                        type: PageTransitionType.leftToRight));
              },
              icon: Icon(
                Icons.done_all,
                color: Colors.blue,
              ))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          GestureDetector(
            onTap: () async {
              await availableCameras().then((value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CameraPage(
                            cameras: value,
                          ))));
            },
            child: Center(
              child: SizedBox(
                height: 106.h,
                width: 92.w,
                child: Stack(
                  children: [
                    Image.asset(namePicture),
                    Center(child: Image.asset("images/cameraicon.png")),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.04,
          ),
          Center(
            child: Text(
              "User Name",
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Center(
              child: Image.asset(
            "images/profileImage2.png",
            width: width * 0.2,
            fit: BoxFit.fitWidth,
          )),
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.07),
            child: TextField(
              controller: userName,
              decoration: InputDecoration(
                hintText: "Enter User Name",
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
        ],
      ),
    );
  }
}

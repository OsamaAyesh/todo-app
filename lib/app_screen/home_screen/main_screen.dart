import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:todo/app_screen/home_screen/book_mark_screen.dart';
import 'package:todo/app_screen/home_screen/home_screen.dart';
import 'package:todo/app_screen/home_screen/profile_screen.dart';
import 'package:todo/app_screen/home_screen/search_screen.dart';

class MainScreen extends StatefulWidget {
   MainScreen({Key? key,required this.image,required this.email,required this.userName}) : super(key: key);
  String image;
  String userName;
  String email;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>  with SingleTickerProviderStateMixin{
  late TextEditingController email;
  late TabController tabController;
  late PageController pageController;
  int index1=0;
  int currentIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    email = TextEditingController();
    tabController=TabController(length: 4, vsync: this);
    pageController=PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.02),
          child: GNav(
            tabBackgroundColor: const Color(0XFF7C37FA),
            gap: 8,
            tabBorderRadius: 15,

            color: const Color(0XFFCBC9D9),
            activeColor: Colors.white,
            selectedIndex: currentIndex,
            onTabChange: (index){
              setState(() {
                pageController.jumpToPage(index);
              });
              tabController.animationDuration;
            },
            padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.02),
            tabs: [
              GButton(icon: Icons.energy_savings_leaf_rounded,text: "Home",),
              // GButton(icon: Icons.search,text: "Search",),
              GButton(icon: Icons.bookmark,text: "Bookmark",),
              GButton(icon: Icons.person,text: "My Profile",),
            ],
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
          physics:const  BouncingScrollPhysics(),
          onPageChanged: (index){
          setState(() {
            currentIndex=index;
          });
          },
          children: [
            HomeScreen(),
            // SearchScreen(),
            BookMarkScreen(),
            ProfileScreen(image: widget.image,email: widget.email,userName: widget.userName,),
      ]),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           height: height * 0.02,
      //         ),
      //         Padding(
      //           padding: EdgeInsets.symmetric(horizontal: width * 0.07),
      //           child: TextField(
      //             controller: email,
      //             decoration: InputDecoration(
      //               hintText: "Search note",
      //               prefixIcon: const Icon(Icons.search),
      //               hintStyle: GoogleFonts.roboto(
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.w400,
      //                   color: const Color(0XFFCBC9D9)),
      //               fillColor: const Color(0XFFF5F6FA),
      //               filled: true,
      //               focusedBorder: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(20),
      //                   borderSide: const BorderSide(
      //                     color: Color(0XFFF5F6FA),
      //                   )),
      //               enabledBorder: OutlineInputBorder(
      //                 borderRadius: BorderRadius.circular(15),
      //                 borderSide: const BorderSide(
      //                   color: Color(0XFFF5F6FA),
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: height * 0.02,
      //         ),
      //         Row(
      //           children: [
      //             const Expanded(child: SizedBox()),
      //             SizedBox(
      //               width: width * 0.4,
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Image.asset(
      //                     "images/main1.png",
      //                     width: width * 0.4,
      //                     height: height * 0.3,
      //                     fit: BoxFit.fitWidth,
      //                   ),
      //                   Row(
      //                     children: [
      //                       SizedBox(
      //                         width: width * 0.02,
      //                       ),
      //                       Text(
      //                         "All note",
      //                         style: GoogleFonts.roboto(
      //                           color: const Color(0XFF0F0A39),
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.w500,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: width * 0.02,
      //                       ),
      //                       Text(
      //                         "(18)",
      //                         style: GoogleFonts.roboto(
      //                           color: const Color(0XFF7C37FA),
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.w500,
      //                         ),
      //                       ),
      //                       const Expanded(child: SizedBox()),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             SizedBox(
      //               width: width * 0.05,
      //             ),
      //             SizedBox(
      //               width: width * 0.4,
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Image.asset(
      //                     "images/main2.png",
      //                     width: width * 0.4,
      //                     height: height * 0.3,
      //                     fit: BoxFit.fitWidth,
      //                   ),
      //                   Row(
      //                     children: [
      //                       SizedBox(
      //                         width: width * 0.02,
      //                       ),
      //                       Text(
      //                         "Notebook ",
      //                         style: GoogleFonts.roboto(
      //                           color: const Color(0XFF0F0A39),
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.w500,
      //                         ),
      //                       ),
      //                       SizedBox(
      //                         width: width * 0.02,
      //                       ),
      //                       Text(
      //                         "(4)",
      //                         style: GoogleFonts.roboto(
      //                           color: const Color(0XFF7C37FA),
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.w500,
      //                         ),
      //                       ),
      //                       const Expanded(child: SizedBox()),
      //                     ],
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             const Expanded(child: SizedBox()),
      //           ],
      //         ),
      //         SizedBox(
      //           height: height * 0.04,
      //         ),
      //         Row(
      //           children: [
      //             SizedBox(
      //               width: width * 0.07,
      //             ),
      //             Text(
      //               "Recent",
      //               style: GoogleFonts.roboto(
      //                   color: const Color(0XFF0F0A39),
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold),
      //             ),
      //             const Expanded(child: SizedBox()),
      //           ],
      //         ),
      //         ListView.builder(
      //           physics: const NeverScrollableScrollPhysics(),
      //             itemCount: 10,
      //             shrinkWrap: true,
      //             itemBuilder: (context, i) {
      //               return Container(
      //                 height: height * 0.13,
      //                 width: width,
      //                 color: const Color(0XFFFFFFFF),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Row(
      //                       children: [
      //                         SizedBox(
      //                           width: width * 0.07,
      //                         ),
      //                         Image.asset("images/list1.png"),
      //                         SizedBox(
      //                           width: width * 0.09,
      //                         ),
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             Text(
      //                               "Shopping List",
      //                               style: GoogleFonts.roboto(
      //                                 color: const Color(0XFF0F0A39),
      //                                 fontSize: 16,
      //                                 fontWeight: FontWeight.w500,
      //                               ),
      //                             ),
      //                             SizedBox(height: height*0.01,),
      //                             Text(
      //                               "May, 29",
      //                               style: GoogleFonts.roboto(
      //                                 color: const Color(0XFF7B7890),
      //                                 fontSize: 14,
      //                                 fontWeight: FontWeight.w400,
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                         const Expanded(child: SizedBox()),
      //                         const Icon(Icons.navigate_next_sharp,color: Color(0XFFCBC9D9),size: 36,),
      //                         SizedBox(
      //                           width: width * 0.07,
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(height: height*0.01,),
      //                     Divider(indent: width*0.07,endIndent: width*0.07,thickness: 2),
      //                   ],
      //                 ),
      //               );
      //             })
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

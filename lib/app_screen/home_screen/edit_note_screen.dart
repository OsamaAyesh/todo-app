import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/home_screen/main_screen.dart';

import '../database/mydatabase.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    Key? key,
     this.title,
     this.date,
     this.note,
     this.id,
  }) : super(key: key);
  final title;
  final date;
  final note;
  final id;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController title = TextEditingController();
  late TextEditingController note = TextEditingController();
  SqlDb sqlDb = SqlDb();
  @override
  void initState() {
    // TODO: implement initState
    title.text=widget.title;
    note.text=widget.note;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: width * 0.02,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child:  MainScreen(image: "images/profileImage.png",email: "phtounganch@gmail.com",userName: "phtuonganh",)));
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
                const Expanded(child: SizedBox()),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(
                //     Icons.mic_none_rounded,
                //     size: 36,
                //     color: Color(0XFF8B64F8),
                //   ),
                // ),
                // IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.water_drop_outlined,
                //       size: 36,
                //     ),),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset("images/camera.png",
                      width: width * 0.08, height: width * 0.1),
                ),

                IconButton(
                  onPressed: () async {
                    int  response= await sqlDb.updateData('''
                          UPDATE notes SET
                          note ="${note.text}",
                          title="${title.text}"
                          WHERE id =${widget.id}
                          ''');
                    print("response============================");
                    if(response>0){
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.rightToLeft,
                              child:  MainScreen(image: "images/profileImage.png",email: "phtounganch@gmail.com",userName: "phtuonganh",)));
                    }
                    print(response);
                  },
                  icon: const Icon(Icons.done_rounded),
                ),
                SizedBox(
                  width: width * 0.02,
                ),
              ],
            ),
            TextField(
              controller: title,
              style: GoogleFonts.roboto(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: const Color(0XFFE7DFFF)),
              cursorColor: const Color(0XFF8B64F8),
              cursorHeight: 40,
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: GoogleFonts.roboto(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: const Color(0XFFE7DFFF)),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.04,
                ),
                Text(
                  "Date : ${widget.date} ",
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: const Color(0XFFE7DFFF)),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            TextField(
              controller: note,
              maxLines: 5,
              style: GoogleFonts.roboto(
                  color: const Color(0XFFEAE4FF),
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: GoogleFonts.roboto(
                    color: const Color(0XFFEAE4FF),
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

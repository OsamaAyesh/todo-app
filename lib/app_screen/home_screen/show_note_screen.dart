import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/home_screen/main_screen.dart';
class ShowNoteScreen extends StatefulWidget {
  const ShowNoteScreen({Key? key,this.title,this.date,this.note,this.id}) : super(key: key);
  final note;
  final title;
  final id;
  final date;

  @override
  State<ShowNoteScreen> createState() => _ShowNoteScreenState();
}

class _ShowNoteScreenState extends State<ShowNoteScreen> {
  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];

    const colorizeTextStyle = TextStyle(
      fontSize: 36,
      fontFamily: 'Horizon',
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:  const Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Text(" This Note  ",style: GoogleFonts.roboto(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'This Title Note',
                      textStyle: GoogleFonts.roboto(
                         fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: colorizeColors,
                    ),
                  ],

                ),
              ),
              Padding(
                padding:const EdgeInsets.all(10),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('${widget.title}',
                        textAlign: TextAlign.center,
                        textStyle: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'This Date Note',
                      textStyle: GoogleFonts.roboto(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: colorizeColors,
                    ),
                  ],

                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('${widget.date}',
                  textAlign: TextAlign.center,
                        textStyle: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
              Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    ColorizeAnimatedText(
                      'This  Note',
                      textStyle: GoogleFonts.roboto(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: colorizeColors,
                    ),
                  ],

                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('${widget.note}',
                        textAlign: TextAlign.center,
                        textStyle: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/database/mydatabase.dart';
import 'package:todo/app_screen/home_screen/show_note_screen.dart';
class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  SqlDb sqlDb=SqlDb();
  List bookMarkNote=[];
  bool colorList=true;
  Future readData() async{
    List<Map> response=await sqlDb.readData("SELECT * FROM bookmark");
    print("object");
    bookMarkNote.addAll(response);
    if(mounted){
      setState(() {
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double hieght=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Note BookMark",style: GoogleFonts.roboto(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: bookMarkNote.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context,i){
        return Slidable(
          // Specify a key if the Slidable is dismissible.
          key: UniqueKey(),
          // The start action pane is the one at the left or the top side.
          startActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: ScrollMotion()),
            // A pane can dismiss the Slidable.
            dismissible: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: DismissiblePane(onDismissed: () async {
                int response = await sqlDb.deleteData(
                    '''DELETE FROM bookmark WHERE id = ${bookMarkNote[i]['id']}''');
                if (response > 0) {
                  bookMarkNote.removeWhere(
                          (element) => element['id'] == bookMarkNote[i]['id']);
                  if (bookMarkNote[i] % 2 == 0) {
                    colorList = false;
                  }
                  // this delete from ui
                  setState(() {});
                }
              }),
            ),
            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                onPressed: (context) async {
                  int response = await sqlDb.deleteData(
                      '''DELETE FROM notes WHERE id = ${bookMarkNote[i]['id']}''');
                  // this delete from data baseb
                  if (response > 0) {
                    bookMarkNote.removeWhere((element) =>
                    element['id'] == bookMarkNote[i]['id']);
                    // this delete from ui
                    setState(() {});

                  }
                },
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete From Book Mark',
              ),
              // SlidableAction(
              //   onPressed: (_) {
              //   },
              //   backgroundColor: const Color(0xFF21B7CA),
              //   foregroundColor: Colors.white,
              //   icon: Icons.edit,
              //   label: 'Edit Note',
              // ),
            ],
          ),

          // The end action pane is the one at the right or the bottom side.
          endActionPane: ActionPane(
            motion: const Padding(
              padding: EdgeInsets.symmetric(vertical: 14),
              child: ScrollMotion(),
            ),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                flex: 1,
                onPressed: (_) {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: ShowNoteScreen(
                            title: bookMarkNote[i]['title'],
                            note: bookMarkNote[i]['note'],
                            date: bookMarkNote[i]['date'],
                            id: bookMarkNote[i]['id'],
                          )));
                },
                backgroundColor: const Color(0xFF7BC043),
                foregroundColor: Colors.white,
                icon: Icons.show_chart,
                label: 'Show Note',
              ),
              // SlidableAction(
              //   onPressed: (_) async{
              //   },
              //   backgroundColor: Color(0xFF0392CF),
              //   foregroundColor: Colors.white,
              //   icon: Icons.bookmark,
              //   label: 'BookMark',
              // ),
            ],
          ),
          // The child of the Slidable is what the user sees when the
          // component is not dragged.
          child: Container(
            height: 110,
            width: width,
            color: const Color(0XFFFFFFFF),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    bookMarkNote.length % 2 == 0
                        ? Image.asset("images/list1.png")
                        : Image.asset("images/list2.png"),
                    SizedBox(
                      width: width * 0.09,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${bookMarkNote[i]['title'].toString().length > 20 ? bookMarkNote[i]['title'].toString().substring(0, 20) : bookMarkNote[i]['title']}${bookMarkNote[i]['title'].toString().length > 20 ? "..." : ""}",
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          style: GoogleFonts.roboto(
                            color: const Color(0XFF0F0A39),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: hieght * 0.01,
                        ),
                        Text(
                          "${bookMarkNote[i]['date']}",
                          style: GoogleFonts.roboto(
                            color: const Color(0XFF7B7890),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    const Icon(
                      Icons.navigate_next_sharp,
                      color: Color(0XFFCBC9D9),
                      size: 36,
                    ),
                    SizedBox(
                      width: width * 0.07,
                    ),
                  ],
                ),
                SizedBox(
                  height: hieght * 0.01,
                ),
                Divider(
                    indent: width * 0.07,
                    endIndent: width * 0.07,
                    thickness: 2),
              ],
            ),
          ),
        );
      }),
    );
  }
}

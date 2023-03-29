import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/database/mydatabase.dart';
import 'package:todo/app_screen/home_screen/add_note_screen.dart';
import 'package:todo/app_screen/home_screen/search_delegate.dart';
import 'package:todo/app_screen/home_screen/show_note_screen.dart';

import 'edit_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController email;
  bool visable = true;
  List notes = [];
  List bookMarkNote = [];
  bool colorList = true;
  Color colorContainer = Colors.white;
  double heightContainer = 110;
  bool save = false;

  Future readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM notes ");
    notes.addAll(response);
    if (mounted) {
      setState(() {});
    }
  }

  Future readDataBook() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM bookmark ");
    bookMarkNote.addAll(response);
    if (mounted) {
      setState(() {});
    }
  }

  SqlDb sqlDb = SqlDb();

  @override
  void initState() {
    // TODO: implement initState
    email = TextEditingController();
    readData();
    readDataBook();
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
    int number = notes.length;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    setState(() {
      number = notes.length;
    });
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: const AddNoteScreen()));
          },
          backgroundColor: const Color(0XFF7C37FA),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(children: [
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                    child: TextField(
                      onTap: () {
                        // showSearch(context: context, delegate:);
                        setState((){
                          visable = !visable;
                        });
                        if(notes[0]['title'].toString().contains(email.text)){

                        }
                      },
                      controller: email,
                      decoration: InputDecoration(
                        hintText: "Search note",
                        prefixIcon: const Icon(Icons.search),
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
                  if (visable) Column(
                    children: [
                      Row(
                        children: [
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "images/main1.png",
                                  width: width * 0.4,
                                  height: height * 0.3,
                                  fit: BoxFit.fitWidth,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      "All note",
                                      style: GoogleFonts.roboto(
                                        color: const Color(0XFF0F0A39),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      "($number)",
                                      style: GoogleFonts.roboto(
                                        color: const Color(0XFF7C37FA),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                          SizedBox(
                            width: width * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "images/main2.png",
                                  width: width * 0.4,
                                  height: height * 0.3,
                                  fit: BoxFit.fitWidth,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      "Notebook ",
                                      style: GoogleFonts.roboto(
                                        color: const Color(0XFF0F0A39),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      "(4)",
                                      style: GoogleFonts.roboto(
                                        color: const Color(0XFF7C37FA),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.07,
                          ),
                          Text(
                            "Notes",
                            style: GoogleFonts.roboto(
                                color: const Color(0XFF0F0A39),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          const Expanded(child: SizedBox()),
                        ],
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: notes.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  child: DismissiblePane(onDismissed: () async {
                                    int response = await sqlDb.deleteData(
                                        '''DELETE FROM notes WHERE id = ${notes[i]['id']}''');
                                    if (response > 0) {
                                      notes.removeWhere((element) =>
                                          element['id'] == notes[i]['id']);
                                      if (notes[i] % 2 == 0) {
                                        colorList = false;
                                      }

                                      // this delete from ui
                                      setState(() {});
                                      setState(() {
                                        number = notes.length;
                                      });
                                    }
                                  }),
                                ),
                                // All actions are defined in the children parameter.
                                children: [
                                  // A SlidableAction can have an icon and/or a label.
                                  SlidableAction(
                                    onPressed: (context) async {
                                      int response = await sqlDb.deleteData(
                                          '''DELETE FROM notes WHERE id = ${notes[i]['id']}''');
                                      // this delete from data base
                                      if (response > 0) {
                                        notes.removeWhere((element) =>
                                            element['id'] == notes[i]['id']);
                                        // this delete from ui
                                        setState(() {});
                                        setState(() {
                                          number = notes.length;
                                        });
                                      }
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                  SlidableAction(
                                    onPressed: (_) {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.leftToRight,
                                            child: EditNoteScreen(
                                              note: notes[i]['note'],
                                              title: notes[i]['title'],
                                              id: notes[i]['id'],
                                              date: notes[i]['date'],
                                            ),
                                          ));
                                    },
                                    backgroundColor: const Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Edit Note',
                                  ),
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
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: ShowNoteScreen(
                                                title: notes[i]['title'],
                                                note: notes[i]['note'],
                                                date: notes[i]['date'],
                                                id: notes[i]['id'],
                                              )));
                                    },
                                    backgroundColor: const Color(0xFF7BC043),
                                    foregroundColor: Colors.white,
                                    icon: Icons.show_chart,
                                    label: 'Show Note',
                                  ),
                                  SlidableAction(
                                    onPressed: (_) async {
                                      await readDataBook();
                                      print(notes.length);
                                      print(i);
                                      setState(() {
                                        bookMarkNote.length;
                                      });
                                      print(bookMarkNote.length);

                                      int response = await sqlDb.insertData('''
                                  INSERT INTO bookmark (`title`,`date`,`note`)
                                  VALUES ("${notes[i]['id']},${notes[i]['title']}","${notes[i]['date']}","${notes[i]['note']}")
                                  ''');

                                      print(
                                          "response============================");
                                    },
                                    backgroundColor: Color(0xFF0392CF),
                                    foregroundColor: Colors.white,
                                    icon: Icons.bookmark,
                                    label: 'BookMark',
                                  ),
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
                                        notes.length % 2 == 0
                                            ? Image.asset("images/list1.png")
                                            : Image.asset("images/list2.png"),
                                        SizedBox(
                                          width: width * 0.09,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${notes[i]['title'].toString().length > 20 ? notes[i]['title'].toString().substring(0, 20) : notes[i]['title']}${notes[i]['title'].toString().length > 20 ? "..." : ""}",
                                              textAlign: TextAlign.start,
                                              maxLines: 3,
                                              style: GoogleFonts.roboto(
                                                color: const Color(0XFF0F0A39),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Text(
                                              "${notes[i]['date']}",
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
                                      height: height * 0.01,
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
                    ],
                  ) else Column(
                    children: [
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: notes.length,
                          shrinkWrap: true,
                          itemBuilder: (context, i) {
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                  child: DismissiblePane(onDismissed: () async {
                                    int response = await sqlDb.deleteData(
                                        '''DELETE FROM notes WHERE id = ${notes[i]['id']}''');
                                    if (response > 0) {
                                      notes.removeWhere((element) =>
                                          element['id'] == notes[i]['id']);
                                      if (notes[i] % 2 == 0) {
                                        colorList = false;
                                      }

                                      // this delete from ui
                                      setState(() {});
                                      setState(() {
                                        number = notes.length;
                                      });
                                    }
                                  }),
                                ),
                                // All actions are defined in the children parameter.
                                children: [
                                  // A SlidableAction can have an icon and/or a label.
                                  SlidableAction(
                                    onPressed: (context) async {
                                      int response = await sqlDb.deleteData(
                                          '''DELETE FROM notes WHERE id = ${notes[i]['id']}''');
                                      // this delete from data base
                                      if (response > 0) {
                                        notes.removeWhere((element) =>
                                            element['id'] == notes[i]['id']);
                                        // this delete from ui
                                        setState(() {});
                                        setState(() {
                                          number = notes.length;
                                        });
                                      }
                                    },
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                  SlidableAction(
                                    onPressed: (_) {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                            type:
                                                PageTransitionType.leftToRight,
                                            child: EditNoteScreen(
                                              note: notes[i]['note'],
                                              title: notes[i]['title'],
                                              id: notes[i]['id'],
                                              date: notes[i]['date'],
                                            ),
                                          ));
                                    },
                                    backgroundColor: const Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Edit Note',
                                  ),
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
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              child: ShowNoteScreen(
                                                title: notes[i]['title'],
                                                note: notes[i]['note'],
                                                date: notes[i]['date'],
                                                id: notes[i]['id'],
                                              )));
                                    },
                                    backgroundColor: const Color(0xFF7BC043),
                                    foregroundColor: Colors.white,
                                    icon: Icons.show_chart,
                                    label: 'Show Note',
                                  ),
                                  SlidableAction(
                                    onPressed: (_) async {
                                      await readDataBook();
                                      print(notes.length);
                                      print(i);
                                      setState(() {
                                        bookMarkNote.length;
                                      });
                                      print(bookMarkNote.length);

                                      int response = await sqlDb.insertData('''
                            INSERT INTO bookmark (`title`,`date`,`note`)
                            VALUES ("${notes[i]['id']},${notes[i]['title']}","${notes[i]['date']}","${notes[i]['note']}")
                            ''');

                                      print(
                                          "response============================");
                                    },
                                    backgroundColor: Color(0xFF0392CF),
                                    foregroundColor: Colors.white,
                                    icon: Icons.bookmark,
                                    label: 'BookMark',
                                  ),
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
                                        notes.length % 2 == 0
                                            ? Image.asset("images/list1.png")
                                            : Image.asset("images/list2.png"),
                                        SizedBox(
                                          width: width * 0.09,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${notes[i]['title'].toString().length > 20 ? notes[i]['title'].toString().substring(0, 20) : notes[i]['title']}${notes[i]['title'].toString().length > 20 ? "..." : ""}",
                                              textAlign: TextAlign.start,
                                              maxLines: 3,
                                              style: GoogleFonts.roboto(
                                                color: const Color(0XFF0F0A39),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Text(
                                              "${notes[i]['date']}",
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
                                      height: height * 0.01,
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
                    ],
                  ),
                ]))));
  }
}

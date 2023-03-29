import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo/app_screen/database/mydatabase.dart';
import 'package:todo/app_screen/home_screen/show_note_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController search;

  @override
  void initState() {
    // TODO: implement initState
    search = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double hieght = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: width * 0.07),
                //   child: TextField(
                //     controller: search,
                //       keyboardType:TextInputType.text,
                //     decoration: InputDecoration(
                //       hintText: "Search note",
                //       prefixIcon: const Icon(Icons.search),
                //       hintStyle: GoogleFonts.roboto(
                //           fontSize: 16,
                //           fontWeight: FontWeight.w400,
                //           color: const Color(0XFFCBC9D9)),
                //       fillColor: const Color(0XFFF5F6FA),
                //       filled: true,
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20),
                //           borderSide: const BorderSide(
                //             color: Color(0XFFF5F6FA),
                //           ),),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(15),
                //         borderSide: const BorderSide(
                //           color: Color(0XFFF5F6FA),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                ElevatedButton(
                    onPressed: () {
                      showSearch(context: context, delegate: MySearchDelegate());

                    },
                    child: const Text("Search"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  SqlDb sqlDb=SqlDb();
  List notes=[
  ];
  Future<List> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM notes ");
    notes.addAll(response);
    return notes;

  }


  @override
  List<Widget>? buildActions(BuildContext context) => [
      IconButton(onPressed: (){
        if(query.isEmpty){
          close(context, null);
        }
        else
          {
            query='';
          }

      }, icon: Icon(Icons.clear))
    ];


  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    IconButton(onPressed: () =>close(context, null), icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
     return ShowNoteScreen();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    // List<Map> response = sqlDb.readData("SELECT * FROM notes ");
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context,i){
        return ListTile(
          title: Text("Osama"),
          onTap: (){
            query="Osama";
          },
        );
      },
      // itemBuilder:(context,i){
      //   return Slidable(
      //     // Specify a key if the Slidable is dismissible.
      //     key: UniqueKey(),
      //     // The start action pane is the one at the left or the top side.
      //     startActionPane: ActionPane(
      //       // A motion is a widget used to control how the pane animates.
      //       motion: const Padding(
      //           padding: EdgeInsets.symmetric(vertical: 14),
      //           child: ScrollMotion()),
      //       // A pane can dismiss the Slidable.
      //       // dismissible: ,
      //       // All actions are defined in the children parameter.
      //       children: [
      //         // A SlidableAction can have an icon and/or a label.
      //         // SlidableAction(
      //         //   onPressed: (context) async {
      //         //     int response = await sqlDb.deleteData(
      //         //         '''DELETE FROM notes WHERE id = ${bookMarkNote[i]['id']}''');
      //         //     // this delete from data baseb
      //         //     if (response > 0) {
      //         //       bookMarkNote.removeWhere((element) =>
      //         //       element['id'] == bookMarkNote[i]['id']);
      //         //       // this delete from ui
      //         //       setState(() {});
      //         //
      //         //     }
      //         //   },
      //         //   backgroundColor: const Color(0xFFFE4A49),
      //         //   foregroundColor: Colors.white,
      //         //   icon: Icons.delete,
      //         //   label: 'Delete From Book Mark',
      //         // ),
      //         // SlidableAction(
      //         //   onPressed: (_) {
      //         //   },
      //         //   backgroundColor: const Color(0xFF21B7CA),
      //         //   foregroundColor: Colors.white,
      //         //   icon: Icons.edit,
      //         //   label: 'Edit Note',
      //         // ),
      //       ],
      //     ),
      //
      //     // The end action pane is the one at the right or the bottom side.
      //     endActionPane: ActionPane(
      //       motion: const Padding(
      //         padding: EdgeInsets.symmetric(vertical: 14),
      //         child: ScrollMotion(),
      //       ),
      //       children: [
      //         SlidableAction(
      //           // An action can be bigger than the others.
      //           flex: 1,
      //           onPressed: (_) {
      //             Navigator.push(
      //                 context,
      //                 PageTransition(
      //                     type: PageTransitionType.rightToLeft,
      //                     child: ShowNoteScreen(
      //                       title: notes[i]['title'],
      //                       note: notes[i]['note'],
      //                       date: notes[i]['date'],
      //                       id: notes[i]['id'],
      //                     )));
      //           },
      //           backgroundColor: const Color(0xFF7BC043),
      //           foregroundColor: Colors.white,
      //           icon: Icons.show_chart,
      //           label: 'Show Note',
      //         ),
      //         // SlidableAction(
      //         //   onPressed: (_) async{
      //         //   },
      //         //   backgroundColor: Color(0xFF0392CF),
      //         //   foregroundColor: Colors.white,
      //         //   icon: Icons.bookmark,
      //         //   label: 'BookMark',
      //         // ),
      //       ],
      //     ),
      //     // The child of the Slidable is what the user sees when the
      //     // component is not dragged.
      //     child: Container(
      //       height: 110,
      //       width: double.infinity,
      //       color: const Color(0XFFFFFFFF),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Row(
      //             children: [
      //               SizedBox(
      //                 width: double.infinity * 0.07,
      //               ),
      //               notes.length % 2 == 0
      //                   ? Image.asset("images/list1.png")
      //                   : Image.asset("images/list2.png"),
      //               SizedBox(
      //                 width: double.infinity * 0.09,
      //               ),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     "${notes[i]['title'].toString().length > 20 ? notes[i]['title'].toString().substring(0, 20) : notes[i]['title']}${notes[i]['title'].toString().length > 20 ? "..." : ""}",
      //                     textAlign: TextAlign.start,
      //                     maxLines: 3,
      //                     style: GoogleFonts.roboto(
      //                       color: const Color(0XFF0F0A39),
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.w500,
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     height: 8.h,
      //                   ),
      //                   Text(
      //                     "${notes[i]['date']}",
      //                     style: GoogleFonts.roboto(
      //                       color: const Color(0XFF7B7890),
      //                       fontSize: 14,
      //                       fontWeight: FontWeight.w400,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               const Expanded(child: SizedBox()),
      //               const Icon(
      //                 Icons.navigate_next_sharp,
      //                 color: Color(0XFFCBC9D9),
      //                 size: 36,
      //               ),
      //               SizedBox(
      //                 width: double.infinity * 0.07,
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 8.h,
      //           ),
      //           Divider(
      //               indent: double.infinity * 0.07,
      //               endIndent: double.infinity * 0.07,
      //               thickness: 2),
      //         ],
      //       ),
      //     ),
      //   );
      // },

    );

  }

}

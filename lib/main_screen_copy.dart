// import 'dart:ffi';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_notes/edit_note.dart';
// import 'package:flutter/material.dart';
// import 'new_note.dart';
// import 'edit_note.dart';

// class MainScreen extends StatefulWidget {
//   MainScreen({Key? key}) : super(key: key);
//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   // final CollectionReference _notes = FirebaseFirestore.instance.collection('notes');

//   TextEditingController note_title = TextEditingController();
//   TextEditingController note_content = TextEditingController();

//   Future<Void> update([DocumentSnapshot? documentSnapshot]) async {
//     if (documentSnapshot != ){
//     note_title.text = documentSnapshot!['note_title'];
//     note_content.text = documentSnapshot!['note_content'];
//   }}

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               StreamBuilder<QuerySnapshot>(
//                 stream:
//                     FirebaseFirestore.instance.collection('notes').snapshots(),
//                 builder:
//                     (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//                   // return ListView.builder(
//                   //   scrollDirection: Axis.vertical,
//                   //     shrinkWrap: true,
//                   //     itemCount: snapshot.data!.docs.length,
//                   //     itemBuilder: (context, index){
//                   //       return ListTile(
//                   //         title: Text('${snapshot.data!.docs[index]['note_title']}'),
//                   //       );
//                   //     });
//                   return streamSnapshot.hasData
//                       ? GridView.builder(
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           gridDelegate:
//                               SliverGridDelegateWithFixedCrossAxisCount(
//                                   crossAxisCount: 2),
//                           itemCount: streamSnapshot.data!.docs.length,
//                           itemBuilder: (context, index) {
//                             return InkWell(
//                                 // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EditNote(streamSnapshot.data!.docs[index]))),
//                                 child: GridTile(
//                               child: Container(
//                                 margin: EdgeInsets.all(10),
//                                 padding: EdgeInsets.all(15),
//                                 decoration: BoxDecoration(
//                                   color: Color.fromARGB(255, 152, 162, 219),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                         '${streamSnapshot.data!.docs[index]['note_title']}'),
//                                     Divider(
//                                       thickness: 2,
//                                     ),
//                                     Text(
//                                       '${streamSnapshot.data!.docs[index]['note_content']}',
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             )
//                             );
//                           },
//                         )
//                       : streamSnapshot.hasError
//                           ? Text('Error occored')
//                           : CircularProgressIndicator();
//                 },
//               ),
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => NewNote()));
//           },
//           icon: Icon(Icons.add),
//           label: Text('Add note'),
//         ),
//       ),
//     );
//   }
// }

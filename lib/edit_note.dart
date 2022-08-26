// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'main_screen.dart';

// class EditNote extends StatefulWidget {
//   DocumentSnapshot? doctoedit;
//   EditNote(this.doctoedit);

//   @override
//   State<EditNote> createState() => _EditNoteState();
// }

// class _EditNoteState extends State<EditNote> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           TextButton(
//               onPressed: () {
//                 Navigator.pop(
//                     context,
//                     widget.doctoedit!.reference.update({
//                       'note_title': note_title.text,
//                       'note_content': note_content.text
//                     }));
//               },
//               child: Text(
//                 'Save',
//                 style: TextStyle(color: Colors.white),
//               ))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: note_title,
//               decoration: InputDecoration(
//                 hintText: 'Note title',
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               child: TextFormField(
//                 maxLines: null,
//                 expands: true,
//                 controller: note_content,
//                 decoration: InputDecoration(hintText: 'Note Content'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

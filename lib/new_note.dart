// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class NewNote extends StatefulWidget {
//   const NewNote({Key? key}) : super(key: key);

//   @override
//   State<NewNote> createState() => _NewNoteState();
// }

// class _NewNoteState extends State<NewNote> {

//   final firestore = FirebaseFirestore.instance;
//   TextEditingController note_title =  TextEditingController();
//   TextEditingController note_content =  TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           TextButton(onPressed: (){
//             Navigator.pop(context,
//             firestore.collection('notes').add({'note_title': note_title.text , 'note_content': note_content.text})
//             );
//           },
//            child: Text('Save' , style: TextStyle(color: Colors.white),))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: note_title,
//               decoration: InputDecoration(hintText: 'Note title',),
//             ),
//             SizedBox(height: 10,),
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

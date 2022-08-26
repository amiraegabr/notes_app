import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
//text field controller
  TextEditingController note_title = TextEditingController();
  TextEditingController note_content = TextEditingController();
//collection ref
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  Future create([DocumentSnapshot? documentSnapshot]) async {
    // await showModalBottomSheet(
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(20.0),
    //     ),
    //     isScrollControlled: true,
    //     context: context,
    //     builder: ((context) {
    //       return Padding(
    //         padding: EdgeInsets.only(
    //             top: 50,
    //             left: 20,
    //             right: 20,
    //             bottom: MediaQuery.of(context).viewInsets.bottom + 20),
    //         child: Column(
    //           mainAxisSize: MainAxisSize.min,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             TextField(
    //               controller: note_title,
    //               decoration: InputDecoration(
    //                 contentPadding: EdgeInsets.all(8),
    //                 border: new OutlineInputBorder(
    //                     borderRadius: new BorderRadius.circular(15.0),
    //                     borderSide: new BorderSide()),
    //                 labelText: 'Note Title',
    //               ),
    //             ),
    //             Expanded(
    //               child: TextField(
    //                 minLines: null,
    //                 maxLines: null,
    //                 expands: true,
    //                 onSubmitted: (content) => note_content.clear(),
    //                 controller: note_content,
    //                 decoration: InputDecoration(
    //                   labelText: 'Note content',
    //                 ),
    //               ),
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
    //             ElevatedButton(
    //               onPressed: () async {
    //                 String title = note_title.text;
    //                 String content = note_content.text;
    //                 await notes.add({
    //                   'note_title': title,
    //                   'note_content': content,
    //                 });
    //                 note_title.clear();
    //                 note_content.clear();
    //                 Navigator.of(context).pop();
    //               },
    //               child: Text('create'),
    //             )
    //           ],
    //         ),
    //       );
    //     }));

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('New Note'),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
              autofocus: true,
              controller: note_title,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide: new BorderSide()),
                labelText: 'Note Title',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              maxLines: 20,
              minLines: null,
              controller: note_content,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8),
                border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide: new BorderSide()),
                labelText: 'Note content',
              ),
            ),
          ]),
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              String title = note_title.text;
              String content = note_content.text;

              await notes.add({
                'note_title': title,
                'note_content': content,
              });
              Navigator.of(context).pop();
              note_title.clear();
              note_content.clear();
            },
            child: Text('create'),
          )
        ],
      ),
    );
  }

  Future update([DocumentSnapshot? documentSnapshot]) async {
    note_title.text = documentSnapshot!['note_title'];
    note_content.text = documentSnapshot['note_content'];
    await showBottomSheet(
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: note_title,
                  decoration: InputDecoration(labelText: 'Note title'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: note_content,
                  decoration: InputDecoration(labelText: 'Note content'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final String title = note_title.text;
                      final String content = note_content.text;
                      await notes.doc(documentSnapshot.id).update({
                        'note_title': note_title,
                        'note_content': note_content
                      });
                      note_title.text = ' ';
                      note_content.text = ' ';
                      Navigator.of(context).pop();
                    },
                    child: Text('update'))
              ],
            ),
          );
        }));
  }

  Future delete(String noteid) async {
    await notes.doc(noteid).delete();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 53, 28, 97),
          title: Text('Firebase notes'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => create(),
          icon: Icon(Icons.add),
          label: Text('Add note'),
          backgroundColor: Color.fromARGB(255, 53, 28, 97),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: notes.snapshots(),
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  return streamSnapshot.hasData
                      ? GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            return GridTile(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 152, 162, 219),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            streamSnapshot.data!.docs[index]
                                                ['note_title'],
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1,
                                        ),
                                        IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: (() => (delete(
                                                streamSnapshot
                                                    .data!.docs[index].id)))),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: Color.fromARGB(255, 53, 28, 97),
                                    ),
                                    Text(
                                      streamSnapshot.data!.docs[index]
                                          ['note_content'],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : streamSnapshot.hasError
                          ? Text('Error occured')
                          : CircularProgressIndicator();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

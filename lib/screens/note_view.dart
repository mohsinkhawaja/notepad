import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/screens/create_notes_screen.dart';
import 'package:notepad/screens/edit_note_screen.dart';

import '../components/components.dart';

class NoteViewScreen extends StatefulWidget {
  const NoteViewScreen({super.key});

  @override
  State<NoteViewScreen> createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  User? userId = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
      ),
      body: Container(
        child: Center(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("note")
                .where("userId", isEqualTo: userId?.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.data!.docs.isEmpty) {
                return Center(child: Text("Data not found"));
              }
              if (snapshot != null && snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var note = snapshot.data!.docs[index]['note'];
                    var noteId = snapshot.data!.docs[index]['userId'];
                    var docId = snapshot.data!.docs[index].id;
                    return Card(
                      child: ListTile(
                        title: Text(note),
                        subtitle: Text(noteId ?? ''),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => EditNoteScreen(),
                                    arguments: {
                                      'note': note,
                                      'docId': docId,
                                    },
                                  );
                                },
                                child: Icon(Icons.edit)),
                            SizedBox(
                              width: 10.0,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await FirebaseFirestore.instance
                                    .collection("notes")
                                    .doc('docId')
                                    .delete();
                              },
                              child: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return Container();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(CreateNoteScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model.dart';
import '../view_model.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({Key? key}) : super(key: key);
  TextEditingController noteController = TextEditingController();

  final NoteViewModel _noteViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final Note note = Get.arguments['note'];
    noteController.text = Get.arguments['noteContent'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: noteController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Edit Note",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                // Create an updated note with the new content
                var updatedNote = Note(
                  id: note.id,
                  userId: note.userId,
                  content: noteController.text,
                  createdAt: note.createdAt,
                );
                Get.back(result: updatedNote);
              },
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}

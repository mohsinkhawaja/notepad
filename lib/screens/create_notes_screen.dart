import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notepad/components/components.dart';

import '../view_model.dart';

class CreateNoteScreen extends StatelessWidget {
  CreateNoteScreen({super.key});
  TextEditingController noteController = TextEditingController();

  final NoteViewModel _noteViewModel = Get.find();
  //User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Note"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: TextFormField(
                controller: noteController,
                maxLines: null,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Add Note",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var note = noteController.text.trim();
                if (note != "") {
                  await _noteViewModel.addNote(note);
                  Get.back(); // Close the CreateNoteScreen
                }
              },
              child: Poppins(
                text: "Done",
                size: 15.0,
                color: Colors.deepPurple.shade500,
              ),
            )
          ],
        ),
      ),
    );
  }
}

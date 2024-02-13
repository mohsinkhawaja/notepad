import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model.dart';
import '../view_model.dart';

class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({Key? key}) : super(key: key);
  final NoteViewModel _noteViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    final Note note = Get.arguments['note'];
    _noteViewModel.noteController.text = Get.arguments['noteContent'];

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
              controller: _noteViewModel.noteController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Edit Note",
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await _noteViewModel.updateNoteContent(
                    note, _noteViewModel.noteController.text.trim());
                Get.back(result: true); // Indicate successful update
              },
              child: Text("Update"),
            ),
          ],
        ),
      ),
    );
  }
}

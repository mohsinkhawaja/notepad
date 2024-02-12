import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view_model.dart';
import 'create_notes_screen.dart';
import 'edit_note_screen.dart';

class NoteViewScreen extends StatelessWidget {
  final NoteViewModel _noteViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
      ),
      body: Container(
        child: Center(
          child: Obx(() {
            var notes = _noteViewModel.notes;

            if (notes.isEmpty) {
              return Center(child: Text("Data not found"));
            }

            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                var note = notes[index];

                return Card(
                  child: ListTile(
                    title: Text(note.content),
                    subtitle: Text(note.userId),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await _noteViewModel.editNote(note, note.content);
                          },
                          child: Icon(Icons.edit),
                        ),
                        SizedBox(width: 10.0),
                        GestureDetector(
                          onTap: () async {
                            await _noteViewModel.deleteNote(note.id);
                          },
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
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

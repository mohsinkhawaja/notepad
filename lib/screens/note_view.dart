import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../view_model.dart';
import 'create_notes_screen.dart';

class NoteViewScreen extends StatelessWidget {
  final NoteViewModel _noteViewModel = Get.put(NoteViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notepad'),
        actions: [
          IconButton(
            onPressed: () async {
              await _noteViewModel.signout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
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
                    // subtitle: Text(note.userId),
                    subtitle: Text(
                      DateFormat.yMd().add_jm().format(note.createdAt),
                    ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(CreateNoteScreen());
        },
        label: const Text('Add Note'),
        icon: Icon(Icons.add),
      ),
    );
  }
}

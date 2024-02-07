import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notepad/components.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Poppins(
          text: "Notepad",
          size: 20.0,
          color: Colors.black,
        ),
        backgroundColor: Colors.purpleAccent.shade100,
      ),
      body: Center(
          child: OpenSans(
        text: 'No Note yet',
        size: 15.0,
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar(
            'Message',
            'Task added successfully',
            mainButton: TextButton(
              onPressed: () {},
              child: Text('click'),
            ),
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        child: Icon(Icons.add, color: Colors.purpleAccent),
      ),
    );
  }
}

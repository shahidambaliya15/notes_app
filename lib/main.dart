import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List notes = [];
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadNotes();
  }

  // Load Data
  void loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('notes');

    if (data != null) {
      setState(() {
        notes = jsonDecode(data);
      });
    }
  }

  // Save Data
  void saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('notes', jsonEncode(notes));
  }

  // Add Note
  void addNote() {
    setState(() {
      notes.add({
        'title': titleController.text,
        'content': contentController.text,
      });
    });
    saveNotes();
    titleController.clear();
    contentController.clear();
  }

  // Update Note
  void updateNote(int index) {
    setState(() {
      notes[index] = {
        'title': titleController.text,
        'content': contentController.text,
      };
    });
    saveNotes();
  }

  // Delete Note
  void deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
    saveNotes();
  }

  void showDialogBox({int? index}) {
    if (index != null) {
      titleController.text = notes[index]['title'];
      contentController.text = notes[index]['content'];
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(index == null ? "Add Note" : "Update Note"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: contentController,
              decoration: InputDecoration(labelText: "Content"),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (index == null) {
                addNote();
              } else {
                updateNote(index);
              }
              Navigator.pop(context);
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes App (SharedPreferences)"),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(notes[index]['title']),
            subtitle: Text(notes[index]['content']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () => showDialogBox(index: index),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteNote(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialogBox(),
        child: Icon(Icons.add),
      ),
    );
  }
}
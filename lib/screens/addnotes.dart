import 'package:flutter/material.dart';

class AddNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
              ),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: TextField(
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Take a note...',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add note logic here
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

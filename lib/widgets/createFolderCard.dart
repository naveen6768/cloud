import 'package:flutter/material.dart';
import '../models/folderStructure.dart';

class CreateFoldersCard extends StatelessWidget {
  final _folderNameController = TextEditingController();
  final Function addFolderCallback;

  CreateFoldersCard(this.addFolderCallback);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _folderNameController,
              decoration: InputDecoration(
                labelText: 'Folder name:',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                addFolderCallback(_folderNameController.text);
              },
              child: Text(
                'Create Folder',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

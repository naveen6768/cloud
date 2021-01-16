import 'package:flutter/material.dart';
import '../widgets/newFolderWidget.dart';
import '../models/folderStructure.dart';

class SubfolderCreation extends StatelessWidget {
  static const id = "SubFolderCreation";
  final _subfolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String uniqueId = ModalRoute.of(context).settings.arguments.toString();
    final List subFoldersInside = <FolderStructure>[];

    return Scaffold(
      appBar: AppBar(
        title: Text(uniqueId),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _subfolderNameController,
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
                      // addFolderCallback(_folderNameController.text);
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
          ),
          // Container(
          //   child: ListView.builder(
          //     itemCount: ,
          //     itemBuilder: (context, index) {
          //     return
          //   },),
          // )
        ],
      ),
    );
  }
}

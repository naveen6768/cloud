import 'package:flutter/material.dart';
import 'package:viitorCloudPk/widgets/folderRenderArea.dart';
import 'package:viitorCloudPk/widgets/newFolderWidget.dart';
import '../models/folderStructure.dart';

class CreateFolder extends StatelessWidget {
  static const id = "CreateFolder";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FolderFlow'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            NewFolderArea(),
          ],
        ),
      ),
    );
  }
}

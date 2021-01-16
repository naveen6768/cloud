import 'package:flutter/material.dart';
import 'package:viitorCloudPk/widgets/createFolderCard.dart';
import 'package:viitorCloudPk/widgets/folderRenderArea.dart';
import '../models/folderStructure.dart';

class NewFolderArea extends StatefulWidget {
  @override
  _NewFolderAreaState createState() => _NewFolderAreaState();
}

class _NewFolderAreaState extends State<NewFolderArea> {
  final List<FolderStructure> upcomingFolders = [
    FolderStructure(
      id: '1',
      folderName: 'sound',
      subFoldersCount: 20,
      filesCount: 10,
    ),
    FolderStructure(
      id: '2',
      folderName: 'soundhg',
      subFoldersCount: 20,
      filesCount: 10,
    ),
    FolderStructure(
      id: '3',
      folderName: 'soundhg',
      subFoldersCount: 20,
      filesCount: 10,
    ),
  ];
  void _addNewFolder(String title) {
    final newFolder = FolderStructure(
      folderName: title,
      filesCount: 10,
      subFoldersCount: 30,
      id: DateTime.now().toString(),
    );
    setState(() {
      upcomingFolders.add(newFolder);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreateFoldersCard(_addNewFolder),
        FolderRenderArea(
          folder_list: upcomingFolders,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import './screens/createFolder.dart';
import './screens/subFolderScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ViitorCloudPk',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: CreateFolder.id,
      routes: {
        SubfolderCreation.id: (context) => SubfolderCreation(),
        CreateFolder.id: (context) => CreateFolder(),
      },
    );
  }
}

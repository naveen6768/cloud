import 'package:flutter/material.dart';
import '../models/folderInfo.dart';
import 'package:multi_select_item/multi_select_item.dart';

class HomeOverviewScreen extends StatefulWidget {
  @override
  _HomeOverviewScreenState createState() => _HomeOverviewScreenState();
}

class _HomeOverviewScreenState extends State<HomeOverviewScreen> {
  final List<FolderInfo> loadedFolders = [
    FolderInfo(
        id: 'q',
        folderImageUrl: 'images/service.png',
        folderName: 'Service',
        subFoldersCount: 0,
        fileCount: 1,
        isIndependentFile: false),
    FolderInfo(
        id: 'q',
        folderImageUrl: 'images/pet.jpg',
        folderName: 'Service',
        subFoldersCount: 0,
        fileCount: 1,
        isIndependentFile: false),
    FolderInfo(
      id: 'w',
      folderImageUrl: 'images/course.png',
      folderName: 'Pet',
      fileCount: 0,
      isIndependentFile: false,
      subFoldersCount: 8,
    ),
    FolderInfo(
      id: 'e',
      folderImageUrl: 'images/songs.jpg',
      folderName: 'Course or Qualification',
      subFoldersCount: 2,
      fileCount: 3,
      isIndependentFile: false,
    ),
    FolderInfo(
        id: 'r',
        folderImageUrl: 'images/utube.png',
        folderName: 'VID_youtube.mp3',
        isIndependentFile: true,
        fileSize: '746.27 KB'),
    FolderInfo(
        id: 'r',
        folderImageUrl: 'images/xls.png',
        folderName: 'VID_youtube.mp3',
        isIndependentFile: true,
        fileSize: '746.27 KB'),
    FolderInfo(
        id: 'r',
        folderImageUrl: 'images/document.png',
        folderName: 'VID_youtube.mp3',
        isIndependentFile: true,
        fileSize: '746.27 KB'),
    FolderInfo(
        id: 'r',
        folderImageUrl: 'images/pdf.png',
        folderName: 'VID_youtube.mp3',
        isIndependentFile: true,
        fileSize: '746.27 KB'),
    FolderInfo(
        id: 'r',
        folderImageUrl: 'images/text.png',
        folderName: 'VID_youtube.mp3',
        isIndependentFile: true,
        fileSize: '746.27 KB'),
    FolderInfo(
        id: 'r',
        folderImageUrl: 'images/vcode.png',
        folderName: 'VID_youtube.mp3',
        isIndependentFile: true,
        fileSize: '746.27 KB'),
  ];
  MultiSelectController controller = new MultiSelectController();

  @override
  void initState() {
    super.initState();
    controller.disableEditingWhenNoneSelected = true;
    controller.set(loadedFolders.length);
  }

  void delete() {
    var list = controller.selectedIndexes;
    list.sort((b, a) =>
        a.compareTo(b)); //reoder from biggest number, so it wont error
    list.forEach((element) {
      loadedFolders.removeAt(element);
    });

    setState(() {
      controller.set(loadedFolders.length);
    });
  }

  void selectAll() {
    setState(() {
      controller.toggleAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var before = !controller.isSelecting;
        setState(() {
          controller.deselectAll();
        });
        return before;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: new Text('Selected ${controller.selectedIndexes.length}  '),
          actions: (controller.isSelecting)
              ? <Widget>[
                  IconButton(
                    icon: Icon(Icons.select_all),
                    onPressed: selectAll,
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: delete,
                  )
                ]
              : <Widget>[],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey[200])),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Welcome, Haresh Vaghela',
                        style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        size: 35.0,
                        color: Color(0xff111d5e),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('images/woman.png'),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(color: Colors.grey[300])),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Quick Access',
                            style: TextStyle(
                              color: Color(0xff0f3057),
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                            ),
                          ),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                        border: Border.all(color: Colors.grey[300])),
                    child: Icon(
                      Icons.format_list_bulleted_outlined,
                      size: 28.0,
                      color: Color(0xff0f3057),
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  itemCount: loadedFolders.length,
                  itemBuilder: (context, i) {
                    return MultiSelectItem(
                      isSelecting: controller.isSelecting,
                      onSelected: () {
                        setState(() {
                          controller.toggle(i);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3.0),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: controller.isSelected(i)
                              ? new BoxDecoration(color: Colors.grey[300])
                              : new BoxDecoration(),
                          child: ListTile(
                            leading: Container(
                              height: 40,
                              child: Image.asset(
                                loadedFolders[i].folderImageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              loadedFolders[i].folderName,
                              style: TextStyle(
                                color: Color(0xff0f3057),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                              loadedFolders[i].isIndependentFile
                                  ? loadedFolders[i].fileSize.toString() +
                                      '  ${DateTime.now()}'
                                  : loadedFolders[i]
                                          .subFoldersCount
                                          .toString() +
                                      ' Folder . ${loadedFolders[i].fileCount.toString()} File',
                            ),
                            trailing: Icon(
                              Icons.more_vert,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xff0f3057),
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          color: Color(0xff0f3057),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.menu,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  Spacer(),
                  Icon(
                    Icons.notification_important_outlined,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Icon(
                    Icons.star_border_outlined,
                    size: 28.0,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 13.0,
                  ),
                  Icon(
                    Icons.person,
                    size: 28.0,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

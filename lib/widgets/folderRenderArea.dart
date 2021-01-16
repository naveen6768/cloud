import 'package:flutter/material.dart';
import 'package:viitorCloudPk/models/folderStructure.dart';
import 'package:multi_select_item/multi_select_item.dart';
import 'package:viitorCloudPk/screens/subFolderScreen.dart';

class FolderRenderArea extends StatefulWidget {
  final List<FolderStructure> folder_list;
  FolderRenderArea({this.folder_list});

  @override
  _FolderRenderAreaState createState() => _FolderRenderAreaState();
}

class _FolderRenderAreaState extends State<FolderRenderArea> {
  MultiSelectController controller = new MultiSelectController();

  @override
  void initState() {
    super.initState();
    controller.disableEditingWhenNoneSelected = true;
    controller.set(widget.folder_list.length);
  }

  void delete() {
    var list = controller.selectedIndexes;
    list.sort((b, a) =>
        a.compareTo(b)); //reoder from biggest number, so it wont error
    list.forEach((element) {
      widget.folder_list.removeAt(element);
    });

    setState(() {
      controller.set(widget.folder_list.length);
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
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Selected: ${controller.selectedIndexes.length}  ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18.0,
                  ),
                ),
                Spacer(),
                if (controller.isSelecting)
                  IconButton(
                    icon: Icon(Icons.select_all),
                    onPressed: selectAll,
                    color: Colors.green,
                  ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: delete,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: widget.folder_list.length,
              itemBuilder: (context, i) {
                return MultiSelectItem(
                  isSelecting: controller.isSelecting,
                  onSelected: () {
                    setState(() {
                      controller.toggle(i);
                    });
                  },
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        SubfolderCreation.id,
                        arguments: widget.folder_list[i].id,
                      );
                    },
                    child: Card(
                      color: controller.isSelected(i)
                          ? Colors.lightBlue[50]
                          : null,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.folder,
                              color: Colors.blue,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.folder_list[i].folderName,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget.folder_list[i].subFoldersCount
                                              .toString() +
                                          ' Folders',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text('.'),
                                    Text(
                                      widget.folder_list[i].filesCount
                                              .toString() +
                                          ' Files',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

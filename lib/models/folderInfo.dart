import 'package:flutter/foundation.dart';

class FolderInfo {
  final String id;
  final String folderImageUrl;
  final String folderName;
  final int subFoldersCount;
  final int fileCount;
  bool isIndependentFile;
  // final String fileName;
  final String fileSize;

  FolderInfo(
      {@required this.id,
      @required this.folderImageUrl,
      @required this.folderName,
      this.subFoldersCount,
      this.fileCount,
      @required this.isIndependentFile,
      // this.fileName,
      this.fileSize});
}

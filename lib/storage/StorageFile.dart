import 'dart:io';

import 'package:path_provider/path_provider.dart';

class StorageFile {
  Future<String> obtainTempPath() async {
    Directory directory = await getTemporaryDirectory();
    return directory.path;
  }

  Future<String> obtainDocumentsPath() async {
    Directory di = await getApplicationDocumentsDirectory();
    return di.path;
  }

  Future<String?> obtainExternalPath() async {
    Directory? directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  Future<String> obtainAppCachePath() async {
    Directory directory = await getApplicationCacheDirectory();
    return directory.uri.path;
  }

  Future<String?> obtainDownloadsPath() async {
    Directory? directory = await getDownloadsDirectory();
    return directory?.path;


  }
}
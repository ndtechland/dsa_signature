// import 'dart:html';
//
// import 'package:flutter/cupertino.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:pdf/widgets.dart';
// class SaveAndOpen {
//   static Future<File> savePdf({
//     required String name,
//     required Document pdf,
//   }) async {
//     final root = Platform.isAndroid ?await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();
//     final file = File('${root!.path}/$name' as List<Object>);
//     await file.writeAsBytes(await pdf.save());
//     print('${root!.path}/$name');
//     return file;
// }
// }

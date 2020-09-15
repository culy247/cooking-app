import 'dart:io';

import 'package:moor/moor.dart';

Uint8List fileToBlob(File file) {
  final bytes = file.readAsBytesSync();
  // return ByteData.view(bytes.buffer);
  return bytes;
}

File blobToFile(Uint8List data) {
  return File.fromRawPath(data);
}

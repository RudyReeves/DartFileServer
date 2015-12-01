import 'dart:io';

import 'package:http_server/http_server.dart';
import 'package:path/path.dart' show join, dirname;

final publicPath = join(dirname(Platform.script.toFilePath()), '..', 'web');
final publicDir = new VirtualDirectory(publicPath);

main() async {
  final server = await HttpServer.bind(InternetAddress.ANY_IP_V6, 8080);
  print("Server listening on ${server.port}:8080...");
  await for (var request in server) {
    publicDir.serveFile(new File('index.html'), request);
  }
}
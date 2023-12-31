import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  final queries = context.request.uri.queryParameters;
  if (queries['f'] == null) {
    return Response(statusCode: 400, body: '?f query parameter is required');
  }
  final fileName = queries['f'];
  final process = await Process.run(
    'dart',
    [
      'run',
      './mason_creatego_cli/bin/mason_creatego_cli.dart',
      '-f', //stands for file name
      fileName!,
    ],
  );
  print('process.stdout');
  print(await process.stdout);
  print(await process.stderr);

  print('process.stdout');
  return Response(body: 'Generated file: ${await process.stdout}');
}

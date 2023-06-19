import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

const String var1 = 'f'; //stands for file name
const String var2 = 'i'; //stands for id
const String var3 = 'j'; //stands for json
Future<Response> onRequest(RequestContext context) async {
  final queries = context.request.uri.queryParameters;
  if (queries[var1] == null) {
    return Response(
        statusCode: 400, body: '?$var1 query parameter is required');
  }
  if (queries[var2] == null) {
    return Response(
        statusCode: 400, body: '?$var2 query parameter is required');
  }
  if (queries[var3] == null) {
    return Response(
        statusCode: 400, body: '?$var3 query parameter is required');
  }
  final arg1 = queries[var1];
  final arg2 = queries[var2];
  final arg3 = queries[var3];
  final process = await Process.run(
    'dart',
    [
      'run',
      './mason_creatego_cli/bin/mason_creatego_cli.dart',
      var1,
      arg1!,
      var2,
      arg2!,
      var3,
      arg3!,
    ],
  );
  print('process.stdout');
  print(await process.stdout);
  print(await process.stderr);
  print('process.stdout');
  return Response(body: 'Generated file: ${await process.stdout}');
}

import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:mason_creatego_cli/generator.dart';
import 'package:mason_creatego_cli/test_json.dart';

const lineNumber = 'line-number';

Future<void> dcat(List<String> paths, {bool showLineNumbers = false}) async {
  if (paths.isEmpty) {
    // No files provided as arguments. Read from stdin and print each line.
    await stdin.pipe(stdout);
  } else {
    for (final path in paths) {
      var lineNumber = 1;
      final lines = utf8.decoder
          .bind(File(path).openRead())
          .transform(const LineSplitter());
      try {
        await for (final line in lines) {
          if (showLineNumbers) {
            stdout.write('${lineNumber++} ');
          }
          stdout.writeln(line);
        }
      } catch (_) {
        await _handleError(path);
      }
    }
  }
}

Future<void> _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('error: $path is a directory');
  } else {
    exitCode = 2;
  }
}

Future<void> main(List<String> arguments) async {
  exitCode = 0; // presume success
  final parser = ArgParser()..addFlag(lineNumber, negatable: false, abbr: 'f');

  ArgResults argResults = parser.parse(arguments);
  final paths = argResults.rest;

  dcat(paths, showLineNumbers: argResults[lineNumber] as bool);

  print('arguments');
  print(paths);
  print('arguments');

  //This argument comes from routes/index.dart as a github json config link
  String fileName = paths[0]; //paths[0];

  // this is downloaded inside the [generate] function
  final json = await downloadJsonFromGithub(fileName);

  // this is the path to the generated file
  final String generatedFilePath = await Generator.generateWidget(json);

  //upload the generated file to github widget book
  await uploadFileToGithub(generatedFilePath);
}

Future<Map<String, dynamic>> downloadJsonFromGithub(String fileName) async {
  final fileLink =
      "https://raw.githubusercontent.com/komiljonovshohjahon/table_layout_demo/main/assets/$fileName.json";
  print("The link is : $fileLink");
  return testJson;
}

Future<void> uploadFileToGithub(String generatedFilePath) async {
  //TODO:
}

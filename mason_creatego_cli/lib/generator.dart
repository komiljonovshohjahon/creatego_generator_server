import 'dart:io';
import 'package:mason/mason.dart';

bool isLinux = false;

const String _linuxPath =
    "/home/creatego-server/Documents/creatego/creatego_generator_server/mason_creatego_cli/gen/bricks/widget_template";
const String _windowsPath = "gen/bricks/widget_template";

class Generator {
  static Future<String> generateWidget(Map<String, dynamic> json) async {
    final brick = Brick.path(isLinux ? _linuxPath : _windowsPath);
    final generator = await MasonGenerator.fromBrick(brick);
    final target = DirectoryGeneratorTarget(Directory.current);
    final res = await generator.generate(
      target,
      vars: json,
      fileConflictResolution: FileConflictResolution.overwrite,
      logger: Logger(theme: LogTheme()),
    );
    return res.first.path;
  }
}

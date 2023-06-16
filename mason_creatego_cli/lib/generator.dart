import 'dart:io';

import 'package:mason/mason.dart';

class Generator {
  static Future<String> generateWidget(Map<String, dynamic> json) async {
    final brick = Brick.path(Platform.isLinux
        ? "/home/creatego-server/Documents/creatego/creatego_generator_server/mason_creatego_cli/gen/bricks/widget_template"
        : "gen/bricks/widget_template");
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

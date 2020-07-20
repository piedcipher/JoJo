import 'dart:io';

import 'package:jojo/jojo.dart';
import 'package:args/args.dart';

void main(final List<String> arguments) {
  final ArgParser argParser = ArgParser();
  argParser.addFlag('onlinefriends',
      abbr: 'o', help: 'Shows Online Friends', negatable: false);
  argParser.addFlag('friends',
      abbr: 'f', help: 'Shows Friends', negatable: false);
  argParser.addFlag('help', abbr: 'h', help: 'Help', negatable: false);
  try {
    final ArgResults argResults = argParser.parse(arguments);
    argResults.arguments.isNotEmpty
        ? argResults.arguments[0] != '-h' && argResults.arguments[0] != '--help'
            ? JoJo(option: argResults.arguments[0])
            : stdout.writeln(
                '\nJoJo is a CLI utility to check last-visit of your CodeForces friends & much more.\n\n${argParser.usage}\n')
        : stderr.writeln('\nNo Flags Supplied. Use -h to print help.\n');
  } on FormatException {
    stderr.writeln('\nInvalid Flag. Available flags are listed below\n');
    stdout.writeln('\n${argParser.usage}\n');
  }
}

# JoJo

:mag: :eyes: CLI utility to check last-visit of your [CodeForces](https://codeforces.com) friends & much more, :rocket: powered by [CodeForces API](https://codeforces.com/apiHelp)

## Features
- [x] Online Friends

## Prerequisite
- [Dart SDK](https://dart.dev/get-dart)

## Setup
1. Clone
```
$ mkdir JoJo && cd JoJo
$ git clone https://github.com/piedcipher/JoJo.git
$ pub get
```

2. Add [API credentials](https://codeforces.com/settings/api) in [config.dart](https://github.com/piedcipher/JoJo/blob/master/lib/config.dart)

3. Run
```
$ dart2aot bin/main.dart bin/release.dart
$ dartaotruntime bin/release.dart -h

JoJo is a CLI utility to check last-visit of your CodeForces friends & much more.

-o, --onlinefriends    Shows Online Friends
-f, --friends          Shows Friends
-h, --help             Help
```

## Dependencies
- [args](https://pub.dev/packages/args)
- [crypto](https://pub.dev/packages/crypto)
- [http](https://pub.dev/packages/http)

## Credits

Created from templates made available by Stagehand under a BSD-style
[license](https://github.com/dart-lang/stagehand/blob/master/LICENSE).

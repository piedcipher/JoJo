import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'config.dart';

const String API_BASE_URL = 'https://codeforces.com/api/';

class JoJo {
  JoJo({final String option}) {
    switch (option) {
      case '-o':
        _getFriends(onlyOnline: true);
        break;
      case '-f':
        _getFriends();
        break;
    }
  }

  void _getFriends({bool onlyOnline = false}) async {
    final http.Response response = await http.get(
        '${API_BASE_URL}user.friends?onlyOnline=${onlyOnline}&apiKey=${API_KEY}&time=${DateTime.now().millisecondsSinceEpoch ~/ 1000}&apiSig=123456${sha512.convert(utf8.encode("123456/user.friends?apiKey=${API_KEY}&onlyOnline=${onlyOnline}&time=${DateTime.now().millisecondsSinceEpoch ~/ 1000}#${API_SECRET}"))}');
    final Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    const String PROFILE_BASE_URL = 'https://codeforces.com/profile/';
    parsedResponse['status'] == 'OK'
        ? (parsedResponse['result'] as List).forEach((final onlineFriend) =>
            stdout.writeln('$onlineFriend - $PROFILE_BASE_URL$onlineFriend'))
        : stderr.writeln('\n${parsedResponse['comment']}\n');
  }
}

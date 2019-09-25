import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';

import 'config.dart';

const API_BASE_URL = 'https://codeforces.com/api/';

class JoJo {
  JoJo({String option}) {
    switch (option) {
      case "of":
        _getOnlineFriends();
        break;
    }
  }

  void _getOnlineFriends() async {
    http.Response response = await http.get(
        '${API_BASE_URL}user.friends?onlyOnline=true&apiKey=${API_KEY}&time=${DateTime.now().millisecondsSinceEpoch ~/ 1000}&apiSig=123456${sha512.convert(utf8.encode("123456/user.friends?apiKey=${API_KEY}&onlyOnline=true&time=${DateTime.now().millisecondsSinceEpoch ~/ 1000}#${API_SECRET}"))}');
    Map<String, dynamic> parsedResponse = jsonDecode(response.body);
    if (parsedResponse['status'] == 'OK') {
      (parsedResponse['result'] as List)
          .forEach((onlineFriend) => stderr.writeln(onlineFriend));
    } else {
      stderr.writeln(parsedResponse['comment']);
    }
  }
}

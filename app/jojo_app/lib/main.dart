import 'package:flutter/material.dart';
import 'package:jojo/jojo.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('JoJo \u{1F440}'),
        ),
        body: Center(
          child: FutureBuilder(
            future: Future.wait(
                [JoJo.getFriends(), JoJo.getFriends(onlyOnline: true)]),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                if (snapshot.data == null)
                  return Text('Null');
                else if (snapshot.data.length == 2) {
                  return ListView.builder(
                    itemBuilder: (_, index) => ListTile(
                      trailing: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: snapshot.data[1]['result']
                                  .contains(snapshot.data[0]['result'][index])
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                      onTap: () async {
                        final profileUrl = 'https://codeforces.com/profile/';
                        await launch(
                            '$profileUrl${snapshot.data[0]['result'][index]}');
                      },
                      title: Text(snapshot.data[0]['result'][index]),
                    ),
                    itemCount: snapshot.data[0]['result'].length,
                  );
                }
                return Text('Error');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

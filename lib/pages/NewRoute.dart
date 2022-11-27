import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  const NewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var params = ModalRoute.of(context)?.settings.arguments;
    print("get route params: $params");

    return Scaffold(
        appBar: AppBar(
          title: const Text("New route"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Image(image: AssetImage('assets/logo.png')),
            const Text("New Route"),
            Text(WordPair.random().toString()),
            TextButton(
                onPressed: () async {
                  try {
                    await Future.delayed(const Duration(seconds: 1))
                        .then((e) => Future.error('error'));
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('Throw Future Error')),
            TextButton(
                onPressed: () => Navigator.pop(context, "back param"),
                child: const Text("Back"))
          ]),
        ));
  }
}

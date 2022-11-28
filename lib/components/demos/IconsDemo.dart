import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/demos/TitleDemo.dart';
import 'package:flutter_app/util/MyIcons.dart';

/// 自定义 Icon、异步错误捕获、引入第三方库
class IconsDemo extends StatelessWidget {
  const IconsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleDemo(title: 'Icon Demo'),
        ElevatedButton.icon(
          icon: Icon(MyIcons.key),
          onPressed: () async {
            try {
              await Future.delayed(const Duration(seconds: 1))
                  .then((e) => Future.error('error'));
            } catch (e) {
              print(e);
            }
          },
          label: Text.rich(TextSpan(children: [
            const TextSpan(text: 'Throw Future Error '),
            TextSpan(text: WordPair.random().toString())
          ])),
        )
      ],
    );
  }
}

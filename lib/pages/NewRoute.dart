import 'package:flutter/material.dart';
import 'package:flutter_app/components/demos/IconsDemo.dart';
import 'package:flutter_app/components/demos/ImageDemo.dart';
import 'package:flutter_app/components/demos/InputTextDemo.dart';
import 'package:flutter_app/components/demos/ProgressDemo.dart';
import 'package:flutter_app/components/demos/SwitchAndCheckBoxDemo.dart';

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
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            const ImageDemo(),
            const IconsDemo(),
            const SwitchAndCheckBoxDemo(),
            const InputTextDemo(),
            const ProgressDemo(),
            // 点击返回并携带参数
            TextButton(
                onPressed: () => Navigator.pop(context, "back param"),
                child: const Text("Back"))
          ]),
        )));
  }
}

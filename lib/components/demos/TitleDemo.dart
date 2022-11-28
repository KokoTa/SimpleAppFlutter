import 'package:flutter/material.dart';

/// 标题，Container 的使用
class TitleDemo extends StatefulWidget {
  const TitleDemo({super.key, required this.title});

  final String title;

  @override
  State<TitleDemo> createState() => _TitleDemoState();
}

class _TitleDemoState extends State<TitleDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          color: Colors.grey,
          border: Border.symmetric(
              vertical: BorderSide(color: Colors.black, width: 2))),
      child: Text(
        widget.title,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/components/demos/TitleDemo.dart';

/// 本地图片和网络图片
class ImageDemo extends StatelessWidget {
  const ImageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleDemo(title: 'Image Demo'),
        Image.asset('assets/logo.png',
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: 200),
        Image.network(
          'http://placekitten.com/200/200',
          width: 100,
          height: 100,
        )
      ],
    );
  }
}

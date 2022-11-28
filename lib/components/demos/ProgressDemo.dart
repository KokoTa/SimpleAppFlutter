import 'package:flutter/material.dart';
import 'package:flutter_app/components/demos/TitleDemo.dart';

class ProgressDemo extends StatefulWidget {
  const ProgressDemo({super.key});

  @override
  State<ProgressDemo> createState() => _ProgressDemoState();
}

class _ProgressDemoState extends State<ProgressDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // 动画执行时间 3 秒
    // 注意 State 类需要混入 SingleTickerProviderStateMixin（提供动画帧计时/触发器）
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleDemo(title: 'Progress Demo'),
        // 模糊进度条(会执行一个动画)
        SizedBox(
          width: 100,
          height: 10,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                .animate(_animationController), // 从灰色变成蓝色,
            value: _animationController.value,
          ),
        ),
        //进度条显示50%
        SizedBox(
          width: 100,
          height: 10,
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
        ),
        // 模糊进度条(会执行一个旋转动画)
        SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue)),
        ),
        //进度条显示50%，会显示一个半圆
        SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation(Colors.blue),
            value: .5,
          ),
        ),
      ],
    );
  }
}

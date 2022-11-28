import 'package:flutter/material.dart';
import 'package:flutter_app/components/demos/TitleDemo.dart';

class SwitchAndCheckBoxDemo extends StatefulWidget {
  const SwitchAndCheckBoxDemo({super.key});

  @override
  State<SwitchAndCheckBoxDemo> createState() => _SwitchAndCheckBoxDemoState();
}

class _SwitchAndCheckBoxDemoState extends State<SwitchAndCheckBoxDemo> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleDemo(title: 'Switch and Checkbox demo'),
        Switch(
          value: _switchSelected, //当前状态
          onChanged: (value) {
            //重新构建页面
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Text(_switchSelected.toString()),
        Checkbox(
          value: _checkboxSelected,
          activeColor: Colors.red, //选中时的颜色
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value!;
            });
          },
        ),
        Text(_checkboxSelected.toString())
      ],
    );
  }
}

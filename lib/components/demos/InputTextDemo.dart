import 'package:flutter/material.dart';
import 'package:flutter_app/components/demos/TitleDemo.dart';

class InputTextDemo extends StatefulWidget {
  const InputTextDemo({super.key});

  @override
  State<InputTextDemo> createState() => _InputTextDemoState();
}

class _InputTextDemoState extends State<InputTextDemo> {
  // TextEditingController _usernameController = TextEditingController(); // controller 可以监听输入、选择文本等
  FocusNode focusNode1 = FocusNode(); // 可以监听焦点变化、进行焦点操作等
  FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    // _usernameController.addListener(() {
    //   print(_usernameController.text);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        // 覆盖默认主题
        data: Theme.of(context).copyWith(
            // outlinedButtonTheme: OutlinedButtonThemeData(
            //     style: OutlinedButton.styleFrom(
            //   foregroundColor: Colors.orange,
            // )),
            // hintColor: Colors.yellow,
            // inputDecorationTheme: const InputDecorationTheme(
            //     labelStyle: TextStyle(color: Colors.green))
            ),
        child: Column(
          children: [
            const TitleDemo(title: 'Input Text Demo'),
            Form(
                child: Column(
              children: [
                TextFormField(
                  // controller: _usernameController,
                  focusNode: focusNode1,
                  decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "input username",
                      prefixIcon: Icon(Icons.person),
                      // 覆盖默认主题
                      hintStyle: TextStyle(color: Colors.blue)),
                  validator: (v) {
                    return v!.trim().isNotEmpty
                        ? null
                        : "user name can't empty";
                  },
                ),
                TextFormField(
                  obscureText: true,
                  focusNode: focusNode2,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "input password",
                      prefixIcon: Icon(Icons.lock)),
                  validator: (v) {
                    return v!.trim().length > 5
                        ? null
                        : "password length must be > 5";
                  },
                ),
                Builder(builder: (ctx) {
                  return Column(
                    children: [
                      // 切换焦点
                      OutlinedButton(
                          onPressed: () {
                            FocusScope.of(ctx).requestFocus(focusNode2);
                          },
                          child: const Text('change focus')),
                      // 关闭键盘
                      OutlinedButton(
                          onPressed: () {
                            focusNode1.unfocus();
                            focusNode2.unfocus();
                          },
                          child: const Text('unfocus')),
                      // 表单校验
                      Row(children: [
                        Expanded(
                            child: ElevatedButton(
                          child: const Text("validate"),
                          onPressed: () {
                            Form.of(ctx)?.validate();
                          },
                        ))
                      ])
                    ],
                  );
                })
              ],
            )),
          ],
        ));
  }
}

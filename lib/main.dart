import 'package:flutter/material.dart';
import 'package:flutter_app/pages/AuthRoute.dart';
import 'package:flutter_app/pages/Home.dart';
import 'package:flutter_app/pages/NewRoute.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final appName = 'app';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        'new_route': (context) => const NewRoute(),
        '/': (context) => const Home(title: 'SimpleApp')
      },
      // 路由表没有的时候会触发
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name!;
          // 这里可以做鉴权判断，跳到指定页面
          if (routeName == 'auth_route') {
            return const AuthRoute();
          } else {
            throw ArgumentError('no page match');
          }
        });
      },
    );
  }
}

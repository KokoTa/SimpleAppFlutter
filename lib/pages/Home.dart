import 'package:flutter/material.dart';
import 'package:flutter_app/pages/NewRoute.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
                onPressed: () async {
                  var result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const NewRoute();
                  }));
                  print('get back params: $result');
                },
                child: const Text("Go new route")),
            TextButton(
                onPressed: () async {
                  var result = await Navigator.of(context)
                      .pushNamed("new_route", arguments: "some params");
                  print('get back params: $result');
                },
                child: const Text("Go new route with params")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("auth_route");
                },
                child: const Text("Go auth route"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:a_modern_forum_project/utils/responsive_display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Welcome to flutter',
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      )),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 48,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                child: const Text('Forum test'))
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (ResponsiveDisplay.isSmallDevice(constraints)) {
            return Text("hello small device ${constraints.maxWidth}");
          } else if (ResponsiveDisplay.isMediumDevice(constraints)) {
            return Text("hello medium device ${constraints.maxWidth}");
          }
          return Text("hello large device ${constraints.maxWidth}");
        },
      ),
    );
  }
}

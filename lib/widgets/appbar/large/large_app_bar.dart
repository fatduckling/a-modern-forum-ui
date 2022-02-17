import 'package:flutter/material.dart';

class LargeAppBar extends StatelessWidget {
  const LargeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              child: const Text('Forum Large'))
        ],
      ),
    );
  }
}

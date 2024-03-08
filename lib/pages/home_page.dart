import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: const Text('ComicBook'),
      ),
      body: Column(
        children: [
          const Divider(),
          if (Device.screenType == ScreenType.mobile) ...[
            const Text('Latest Issues'),
            const Text('Latest Issues'),
          ],
          const Text('Latest Issues'),
          const Divider(),
        ],
      ),
    );
  }
}

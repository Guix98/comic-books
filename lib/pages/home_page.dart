import 'package:comic_book/controllers/content_controller.dart';
import 'package:comic_book/controllers/user_controller.dart';
import 'package:comic_book/widgets/grid_layout.dart';
import 'package:comic_book/widgets/list_layout.dart';
import 'package:comic_book/widgets/view_selector.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  final UserController userController = Get.find();

  final ContentController contentController = Get.find();

  @override
  void initState() {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        contentController.loadMoreIssues();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        title: const Text('ComicBook'),
      ),
      body: Obx(() => Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Row(
                          children: [
                            const Icon(FontAwesome.google),
                            SizedBox(
                              width: 1.w,
                            ),
                            const Text(
                              'Log In Here!',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ))
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Latest Issues',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ViewSelector(onChanged: (view) {
                      contentController.setIsListView((view == 'ListView'));
                      setState(() {});
                    })
                  ],
                ),
                const Divider(),
                if (contentController.getIsListView) ...[
                  ListLayout(
                      controller: controller, items: contentController.issues)
                ],
                if (!contentController.getIsListView) ...[
                  GridLayout(
                      controller: controller, items: contentController.issues)
                ],
              ],
            ),
          )),
    );
  }
}

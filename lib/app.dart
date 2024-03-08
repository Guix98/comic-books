import 'package:comic_book/controllers/comic_details_controller.dart';
import 'package:comic_book/controllers/content_controller.dart';
import 'package:comic_book/controllers/user_controller.dart';
import 'package:comic_book/pages/home_page.dart';
import 'package:comic_book/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final ContentController contentController = Get.put(ContentController());
  final ComicDetailsController comicController =
      Get.put(ComicDetailsController());
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          color: Colors.grey[350],
          debugShowCheckedModeBanner: false,
          title: 'Comic Book',
          theme: webTheme(),
          home: const HomePage(),
        );
      },
    );
  }
}

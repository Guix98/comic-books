import 'package:comic_book/controllers/user_controller.dart';
import 'package:comic_book/helpers/helpers.dart';
import 'package:comic_book/models/issue.dart';
import 'package:comic_book/pages/comic_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GridLayout extends StatelessWidget {
  final ScrollController controller;
  final List<Issue> items;
  GridLayout({super.key, required this.controller, required this.items});
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
            child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.75,
            crossAxisCount: Get.width > 800 ? 4 : 2,
          ),
          controller: controller,
          itemCount: items.length + 1,
          itemBuilder: (context, index) {
            if (index < items.length) {
              final item = items[index];
              return GestureDetector(
                onTap: () {
                  if (userController.displayName.isEmpty) {
                    showLogInDialog();
                  } else {
                    Get.to(() => ComicDetailsPage(id: item.id!));
                  }
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20.h,
                      height: Get.width > 600 ? 20.h : 15.h,
                      child: Image.network(item.image!.originalUrl!),
                    ),
                    Column(
                      children: [
                        Text(
                          "${item.name} #${item.issueNumber}",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          formatDate(item.dateAdded!),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  ],
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                ),
              );
            }
          },
        )));
  }
}
